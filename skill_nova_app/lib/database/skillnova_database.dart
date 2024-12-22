import 'package:flutter/foundation.dart' show immutable;
import 'package:path/path.dart';
import 'package:skill_nova_app/models/course_category.dart';
import 'package:skill_nova_app/models/mission.dart';
import 'package:sqflite/sqflite.dart';

@immutable
class SkillNovaDatabase {
  static const String _databaseName = 'skillnova.db';
  static const int _databaseVersion = 1;

  const SkillNovaDatabase._privateConstructor();
  static const SkillNovaDatabase instance = SkillNovaDatabase._privateConstructor();

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
    );
  }

  Future _createDB (
    Database db,
    int version,
  ) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';  // For fields like years, months, etc.

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
  }

  Future<CourseCategory> createCourseCategory(CourseCategory courseCategory) async {
    final db = await instance.database;
    final id = await db.insert(courseCategoriesTable, courseCategory.toMap());
    return courseCategory.copy(id: id);
  }

  Future<Mission> createMission(Mission mission) async {
    final db = await instance.database;
    final id = await db.insert(missionsTable, mission.toMap());
    return mission.copy(id: id);
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

  Future<List<CourseCategory>> readAllCourseCategories() async {
    final db = await instance.database;
    const orderBy = '${CourseCategoryFields.title} ASC';
    final result = await db.query(
      courseCategoriesTable, 
      orderBy: orderBy
    );
    return result.map((courseCategoryData) => CourseCategory.fromMap(courseCategoryData)).toList();
  }

  Future<List<Mission>> readAllMissions() async {
    final db = await instance.database;
    const orderBy = '${MissionFields.id} DESC';
    final result = await db.query(
      missionsTable, 
      orderBy: orderBy
    );
    return result.map((missionData) => Mission.fromMap(missionData)).toList();
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

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}