import 'dart:async';
import 'package:mysqli_attempt_3/models/model.dart';
import 'package:sqflite/sqflite.dart';
abstract class DB {
	static Database _db;
	static int get _version => 2;
	static Future<void> init() async {
		print("db initiated0");
		if (_db != null) {
			print("db initiated1");
			return;
		}
		try {
			String _path = await getDatabasesPath() + 'example2';
			_db = await openDatabase(_path, version: _version, onCreate: onCreate);
			print("db initiated2");
		} catch (ex) {
			print(ex);
		}
	}
	static void onCreate(Database db, int version) async => await db.execute(
			'CREATE TABLE product (id INTEGER PRIMARY KEY NOT NULL ,barcode STRING, name STRING, price REAL)');


	static Future<List<Map<String, dynamic>>> query(String table) async =>
			_db.query(table);
	static Future<int> insert({String table, Model model}) async =>
			await _db.insert(table, model.toMap());
	static Future<int> update(String table, Model model) async => await _db
			.update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);
	static Future<int> delete(String table, Model model) async =>
			await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);
}
