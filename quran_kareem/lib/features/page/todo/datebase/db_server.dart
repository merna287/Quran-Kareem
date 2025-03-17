import 'package:quran_kareem/features/page/todo/model/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBServer {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL, 
            date TEXT NOT NULL
          )
        ''');
      },
    );
  }
  static Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> insertTask(Task task) async {
    final db = await database;
  return await db.insert('tasks', task.toMap());
  }

  static Future<List<Task>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return maps.isNotEmpty ? List.generate(maps.length, (i) => Task.fromMap(maps[i])) : [];
  }
}
