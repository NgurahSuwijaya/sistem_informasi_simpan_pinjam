import 'dart:async';
import 'package:sqflite/sqflite.dart';

import '../../domain/models/notification_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/simpin.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE notifications (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          notifTitle TEXT,
          notifContent TEXT,
          isReaded INTEGER
        )
      ''');
  }

  Future<void> insertNotification(NotificationModel notification) async {
    var value = {
      'notifTitle': notification.notifTitle,
      'notifContent': notification.notifContent,
      'isReaded': notification.isReaded ? 1 : 0
    };
    final db = await database;
    await db!.insert('notifications', value);
  }

  Future<List<NotificationModel>> getAllNotifications() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('notifications');
    return List.generate(maps.length, (index) {
      return NotificationModel(
        id: maps[index]['id'],
        notifTitle: maps[index]['notifTitle'],
        notifContent: maps[index]['notifContent'],
        isReaded: maps[index]['isReaded'] == 1,
      );
    });
  }

  Future<void> updateNotification(NotificationModel notification) async {
    final db = await database;
    await db!.update(
      'notifications',
      notification.toMap(),
      where: 'id = ?',
      whereArgs: [notification.id],
    );
  }

  Future<void> deleteNotification(int id) async {
    final db = await database;
    await db!.delete(
      'notifications',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
