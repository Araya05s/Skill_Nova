// Singleton database class for SkillNova

import 'package:flutter/foundation.dart' show immutable;
import 'package:path/path.dart';
import 'package:skill_nova_app/models/challenge.dart';
import 'package:skill_nova_app/models/course_category.dart';
import 'package:skill_nova_app/models/mission.dart';
import 'package:skill_nova_app/models/users.dart';
import 'package:sqflite/sqflite.dart';

@immutable
class SkillNovaDatabase {
  static const String _databaseName = 'skillnova.db';
  static const int _databaseVersion = 1;

  const SkillNovaDatabase._privateConstructor();
  static const SkillNovaDatabase instance =
      SkillNovaDatabase._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null && _database!.isOpen) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    final String path = join(dbPath, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future<bool> authenticate(Users usr) async {
    final Database db = await instance.database;
    var result = await db.query(
      "users",
      columns: ["*"],
      where: 'usrName = ? AND usrPassword = ?',
      whereArgs: [usr.usrName, usr.password],
    );
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> createUser(Users usr) async {
    final Database db = await instance.database;
    return db.insert("users", usr.toMap());
  }

  Future<Users?> getUser(String usrName, {List<String> columns = ["*"]}) async {
    final Database db = await instance.database;
    var result = await db.query(
      "users",
      columns: ["*"],
      where: 'usrName = ?',
      whereArgs: [usrName],
    );
    return result.isNotEmpty ? Users.fromMap(result.first):null;
  }


  Future _createDB(
    Database db,
    int version,
  ) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL'; // For fields like years, months, etc.

    await db.execute('''
      CREATE TABLE IF NOT EXISTS $courseCategoriesTable (
        ${CourseCategoryFields.id} $idType,
        ${CourseCategoryFields.title} $textType,
        ${CourseCategoryFields.skills} $textType,
        ${CourseCategoryFields.lowerDuration} $textType,
        ${CourseCategoryFields.upperDuration} $textType,
        ${CourseCategoryFields.certificateType} $textType,
        ${CourseCategoryFields.tags} $textType,
        ${CourseCategoryFields.image} $textType
      )
      ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS $missionsTable (
        ${MissionFields.id} $idType,
        ${MissionFields.categoryId} $intType,
        ${MissionFields.title} $textType,
        ${MissionFields.courseMaterials} $textType,
        ${MissionFields.courseMaterialsCount} $intType,
        ${MissionFields.xpReward} $intType,
        ${MissionFields.duration} $textType,
        ${MissionFields.image} $textType,
        ${MissionFields.isActive} $intType,
        FOREIGN KEY (${MissionFields.categoryId}) REFERENCES $courseCategoriesTable(${CourseCategoryFields.id}) ON DELETE CASCADE ON UPDATE CASCADE
      )
      ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS $challengesTable (
        ${ChallengeFields.id} $idType,
        ${ChallengeFields.categoryId} $intType,
        ${ChallengeFields.title} $textType,
        ${ChallengeFields.questions} TEXT,
        ${ChallengeFields.difficulty} $textType,
        ${ChallengeFields.xpReward} $intType,
        ${ChallengeFields.duration} $textType,
        ${ChallengeFields.image} $textType,
        ${ChallengeFields.isActive} $intType,
        FOREIGN KEY (${ChallengeFields.categoryId}) REFERENCES $courseCategoriesTable(${CourseCategoryFields.id}) ON DELETE CASCADE ON UPDATE CASCADE
      )
      ''');
  }

  Future _upgradeDB(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS users (
        usrId INTEGER PRIMARY KEY AUTOINCREMENT,
        fullName TEXT,
        email TEXT,
        usrName TEXT UNIQUE,
        usrPassword TEXT,
        isAdmin INTEGER NOT NULL
      )
      ''');
  }

  Future<CourseCategory> createCourseCategory(
      CourseCategory courseCategory) async {
    final db = await instance.database;
    final id = await db.insert(courseCategoriesTable, courseCategory.toMap());
    return courseCategory.copy(id: id);
  }

  Future<Mission> createMission(Mission mission) async {
    final db = await instance.database;
    final id = await db.insert(missionsTable, mission.toMap());
    return mission.copy(id: id);
  }

  Future<Challenge> createChallenge(Challenge challenge) async {
    final db = await instance.database;
    final id = await db.insert(challengesTable, challenge.toJSON());
    return challenge.copy(id: id);
  }

  Future<CourseCategory> readCourseCategory(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      courseCategoriesTable,
      columns: CourseCategoryFields.values,
      where: '${CourseCategoryFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return CourseCategory.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<Mission> readMission(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      missionsTable,
      columns: MissionFields.values,
      where: '${MissionFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Mission.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<Challenge> readChallenge(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      challengesTable,
      columns: ChallengeFields.values,
      where: '${ChallengeFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Challenge.fromJSON(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<CourseCategory>> readAllCourseCategories() async {
    final db = await instance.database;
    const orderBy = '${CourseCategoryFields.title} ASC';
    final result = await db.query(courseCategoriesTable, orderBy: orderBy);
    return result
        .map((courseCategoryData) => CourseCategory.fromMap(courseCategoryData))
        .toList();
  }

  Future<List<CourseCategory>> searchCourseCategories(String query) async {
    final db = await database;

    // Search only by title field
    final result = await db.query(
      'course_categories',
      where: 'title LIKE ?', // Search in the title field
      whereArgs: ['%$query%'], // Partial matching for the title
    );

    return result.map((map) => CourseCategory.fromMap(map)).toList();
  }

  Future<List<Mission>> readAllMissions({bool onlyIsActive = false}) async {
    final db = await instance.database;
    const orderBy = '${MissionFields.id} DESC';
    final result = await db.query(missionsTable, orderBy: orderBy);

    if (onlyIsActive) {
      return result
          .where((missionData) => missionData[MissionFields.isActive] == 1)
          .map((missionData) => Mission.fromMap(missionData))
          .toList();
    }
    return result.map((missionData) => Mission.fromMap(missionData)).toList();
  }

  Future<List<Challenge>> readAllChallenges({bool onlyIsActive = false}) async {
    final db = await instance.database;
    const orderBy = '${ChallengeFields.id} DESC';
    final result = await db.query(challengesTable, orderBy: orderBy);
    if (onlyIsActive) {
      return result
          .where(
              (challengeData) => challengeData[ChallengeFields.isActive] == 1)
          .map((challengeData) => Challenge.fromJSON(challengeData))
          .toList();
    }
    return result
        .map((challengeData) => Challenge.fromJSON(challengeData))
        .toList();
  }

  Future<int> updateCourseCategory(CourseCategory courseCategory) async {
    final db = await instance.database;
    return await db.update(
      courseCategoriesTable,
      courseCategory.toMap(),
      where: '${CourseCategoryFields.id} = ?',
      whereArgs: [courseCategory.id],
    );
  }

  Future<int> updateMission(Mission mission) async {
    final db = await instance.database;
    return await db.update(
      missionsTable,
      mission.toMap(),
      where: '${MissionFields.id} = ?',
      whereArgs: [mission.id],
    );
  }

  Future<int> updateChallenge(Challenge challenge) async {
    final db = await instance.database;
    return await db.update(
      challengesTable,
      challenge.toJSON(),
      where: '${ChallengeFields.id} = ?',
      whereArgs: [challenge.id],
    );
  }

  Future<int> deleteCourseCategory(int id) async {
    final db = await instance.database;

    return await db.delete(
      courseCategoriesTable,
      where: '${CourseCategoryFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteMission(int id) async {
    final db = await instance.database;

    return await db.delete(
      missionsTable,
      where: '${MissionFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteChallenge(int id) async {
    final db = await instance.database;

    return await db.delete(
      challengesTable,
      where: '${ChallengeFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
