import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqll/Model/listModel.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'ListData.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE ListData (title TEXT, description TEXT UNIQUE, Owner TEXT, weight INTEGER, price INTEGER)',
    );
  }

  Future<int> insert(ListData data) async {
    Database dbClient = await db;
    return await dbClient.insert('ListData', data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ListData>> getCartList() async {
    var dbCilent = await db;
    final List<Map<String, Object?>> queryResult =
        await dbCilent!.query('ListData');
    return queryResult.map((e) => ListData.fromMap(e)).toList();
  }

  Future<int> delete(String title) async {
    var dbClient = await db;
    return await dbClient
        .delete('ListData', where: 'title = ?', whereArgs: [title]);
  }

  Future<int> updateQuaintity(ListData data) async {
    var dbClient = await db;
    return await dbClient.update('ListData', data.toMap(),
        where: 'title = ?', whereArgs: [data.title]);
  }
}
