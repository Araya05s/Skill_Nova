// Singleton database class for SkillNova app

import 'package:flutter/foundation.dart' show immutable;
import 'package:path/path.dart';
import 'package:skill_nova_app/models/challenge.dart';
import 'package:skill_nova_app/models/course_category.dart';
import 'package:skill_nova_app/models/mission.dart';
import 'package:sqflite/sqflite.dart';

@immutable
class SkillNovaDatabase {
  static const String _databaseName = 'skillnova.db';
  static const int _databaseVersion = 2;

  const SkillNovaDatabase._privateConstructor();
  static const SkillNovaDatabase instance =
      SkillNovaDatabase._privateConstructor();

  static Database? _database;

  static const List<String> defaultColumns = ["*"];

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
    if (oldVersion < 2) {
      // Add the `is_active` column to the `course_categories` table.
      await db.execute('''
      ALTER TABLE $courseCategoriesTable ADD COLUMN ${CourseCategoryFields.isActive} INTEGER NOT NULL DEFAULT 1;
    ''');
    }
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

  Future<List<CourseCategory>> readAllCourseCategories(
      {bool onlyIsActive = false}) async {
    final db = await instance.database;
    const orderBy = '${CourseCategoryFields.id} DESC';
    final result = await db.query(courseCategoriesTable, orderBy: orderBy);

    if (onlyIsActive) {
      return result
          .where((courseCategoryData) =>
              courseCategoryData[CourseCategoryFields.isActive] == 1)
          .map((courseCategoryData) =>
              CourseCategory.fromMap(courseCategoryData))
          .toList();
    }

    return result
        .map((courseCategoryData) => CourseCategory.fromMap(courseCategoryData))
        .toList();
  }

  Future<List<CourseCategory>> searchCourseCategories(String query,
      {bool onlyIsActive = false}) async {
    final db = await database;

    // Search only by title field
    final result = await db.query(
      'course_categories',
      where: 'title LIKE ?', // Search in the title field
      whereArgs: ['%$query%'], // Partial matching for the title
    );

    if (onlyIsActive) {
      return result
          .where((map) => map[CourseCategoryFields.isActive] == 1)
          .map((map) => CourseCategory.fromMap(map))
          .toList();
    }

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

  /* Future<List<Mission>> readAllMissionsWithCourseCategories(
      {bool onlyIsActive = false}) async {
    final db = await instance.database;
    final result = await db.rawQuery('''
      SELECT $missionsTable.*, $courseCategoriesTable.*
      FROM $missionsTable
      JOIN $courseCategoriesTable ON $missionsTable.${MissionFields.categoryId} = $courseCategoriesTable.${CourseCategoryFields.id}
      ORDER BY $missionsTable.${MissionFields.id} DESC
    ''');
    List<Mission> missions = result.map((missionData) {
      var missionMap = Map<String, dynamic>.from(missionData);
      var courseCategoryMap = {
        ...missionMap
          ..removeWhere((key, value) => !key.startsWith(
              courseCategoriesTable))
      };
      Mission mission = Mission.fromMap(missionMap);
      CourseCategory? courseCategory = courseCategoryMap.isNotEmpty ? CourseCategory.fromMap(courseCategoryMap) : null;
      mission.courseCategory = courseCategory;
      return mission;
    }).toList();
    if (onlyIsActive) {
      return missions.where((mission) => mission.isActive).toList();
    }
    return missions;
  }*/

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
