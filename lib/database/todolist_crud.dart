import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todolist/models/todolist_model.dart';

class TodoListDatabase {
  static final TodoListDatabase _instance = TodoListDatabase._internal();
  factory TodoListDatabase() => _instance;

  TodoListDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todolist.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            category TEXT NOT NULL,
            isDone INTEGER NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE history (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            category TEXT NOT NULL,
            isDone INTEGER NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> createTodo(TodoItem todo) async {
    final db = await database;
    return await db.insert('todos', {
      'title': todo.title,
      'description': todo.description,
      'category': todo.category,
      'isDone': todo.isDone ? 1 : 0,
    });
  }

  Future<List<TodoItem>> readTodos() async {
    final db = await database;
    final result = await db.query('todos');
    return result.map((json) => TodoItem(
      id: json['id'] as int, // Tambahkan id
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      isDone: (json['isDone'] as int) == 1,
    )).toList();
  }

  Future<int> updateTodo(int id, TodoItem todo) async {
    final db = await database;
    return await db.update(
      'todos',
      {
        'title': todo.title,
        'description': todo.description,
        'category': todo.category,
        'isDone': todo.isDone ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTodo(int id) async {
    final db = await database;
    return await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllTodos() async {
    final db = await database;
    await db.delete('todos');
  }

  Future<int> addToHistory(TodoItem item) async {
    final db = await database;
    return await db.insert('history', {
      'title': item.title,
      'description': item.description,
      'category': item.category,
      'isDone': item.isDone ? 1 : 0,
    });
  }

  Future<List<TodoItem>> readHistory() async {
    final db = await database;
    final result = await db.query('history');
    return result.map((json) => TodoItem(
      id: json['id'] as int, // Tambahkan id
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      isDone: (json['isDone'] as int) == 1,
    )).toList();
  }

  Future<int> deleteHistory(int id) async {
  final db = await database;
  return await db.delete(
    'history',
    where: 'id = ?',
    whereArgs: [id],
  );
}

}
