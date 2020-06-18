import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:diversification/database/model/food.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class DatabaseHelper {
  static final DatabaseHelper db = DatabaseHelper._internal();

  factory DatabaseHelper() => db;

  DatabaseHelper._internal();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    print("initDB");
    return await openDatabase(path,
        version: 1,
        onOpen: (db) {},
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onDowngrade: _onDowngrade);
  }

  Future _onCreate(Database db, int version) async {
    print("_onCreate");
    await db.execute("CREATE TABLE Food ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "minYear INTEGER,"
        "type TEXT,"
        "introduced BIT,"
        "feedback INTEGER,"
        "image TEXT"
        ")");
    await _loadSQLData(db);
  }

  Future _loadSQLData(Database db) async {
    print("loadSQLData");
    String data = await rootBundle.loadString('assets/insert.sql');
    print(data);
    var batch = db.batch();
    LineSplitter().convert(data).forEach((element) {
      batch.execute(element);
      print(element);
    });
    await batch.commit();
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("DROP TABLE Food");
    await _onCreate(db, newVersion);
  }

  Future _onDowngrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("DROP TABLE Food");
    await _onCreate(db, newVersion);
  }

  Future<Food> newFood(Food newFood) async {
    final db = await database;
    newFood.id = await db.insert("Food", newFood.toMap());
    return newFood;
  }

  Future<List<Food>> getAllFoods() async {
    final db = await database;
    List<Map> maps = await db.rawQuery("SELECT * FROM Food");
    List<Food> foods =
        maps.isNotEmpty ? maps.map((c) => Food.fromMap(c)).toList() : [];
    return foods;
  }

  Future<Food> getFoodById(int id) async {
    final db = await database;
    List<Map> maps = await db.query("Food", where: "id = ?", whereArgs: [id]);
    return maps.isNotEmpty ? Food.fromMap(maps.first) : null;
  }

  Future<List<Food>> getIntroducedFood() async {
    final db = await database;
    List<Map> maps =
        await db.query("Food", where: "introduced = ?", whereArgs: [1]);
    List<Food> foods =
        maps.isNotEmpty ? maps.map((c) => Food.fromMap(c)).toList() : [];
    return foods;
  }

  Future<int> update(Food food) async {
    final db = await database;
    return await db
        .update("Food", food.toMap(), where: 'id = ?', whereArgs: [food.id]);
  }

  Future close() async => db.close();
}
