import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class DbHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
      return _db;
    }
  }

  Future<Database?> initDB() async {
    String path = await getDatabasesPath();
    String fullPath = join(path, "Movies.db");
    debugPrint("Database path: $fullPath");
    return openDatabase(fullPath, onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE "Wish"(
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "title" TEXT NOT NULL,
      "overview" TEXT NOT NULL
    )''');
    debugPrint("Table Wish created");
  }

  Future<List<Map<String, dynamic>>> getData(String sql) async {
    Database? myDB = await db;
    return await myDB!.rawQuery(sql);
  }

  Future<int> insertData(String sql) async {
    Database? myDB = await db;
    return await myDB!.rawInsert(sql);
  }

  Future<int> deleteData(String sql) async {
    Database? myDB = await db;
    return await myDB!.rawDelete(sql);
  }

  Future<void> checkDatabaseExistence() async {
    String path = join(await getDatabasesPath(), "Movies.db");
    final file = File(path);
    debugPrint("Does database exist? ${await file.exists()}");
  }
}
