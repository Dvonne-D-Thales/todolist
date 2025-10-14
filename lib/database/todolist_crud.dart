import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todolist/models/todolist_model.dart'; // Pastikan model TodoItem sudah ada

class TodoListDatabase {
  // ------------------------------
  // 🔸 Singleton Pattern
  // ------------------------------
  // Artinya: hanya akan ada SATU instance dari TodoListDatabase
  // agar tidak terjadi duplikasi koneksi database di aplikasi.
  static final TodoListDatabase _instance = TodoListDatabase._internal();
  factory TodoListDatabase() => _instance;
  TodoListDatabase._internal();

  // Variabel untuk menyimpan objek database
  static Database? _database;

  // Getter untuk mengakses database.
  // Jika database belum ada, akan dipanggil _initDatabase() untuk membuatnya.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // ------------------------------
  // 🔸 Inisialisasi Database
  // ------------------------------
  Future<Database> _initDatabase() async {
    // Ambil lokasi penyimpanan database di perangkat
    final dbPath = await getDatabasesPath();
    // Tentukan nama file database
    final path = join(dbPath, 'todolist.db');

    // Buka atau buat database
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Tabel utama untuk daftar tugas (todos)
        await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            category TEXT NOT NULL,
            isDone INTEGER NOT NULL
          )
        ''');

        // Tabel kedua untuk riwayat tugas yang sudah diselesaikan (history)
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

  // =======================================================
  // 🧩 BAGIAN 1: CRUD UNTUK TODOS
  // =======================================================

  /// Menambahkan 1 todo baru ke database
  Future<int> createTodo(TodoItem todo) async {
    final db = await database;
    return await db.insert('todos', {
      'title': todo.title,
      'description': todo.description,
      'category': todo.category,
      'isDone': todo.isDone ? 1 : 0, // Boolean disimpan sebagai 1/0
    });
  }

  /// Membaca semua todo dari database
  Future<List<TodoItem>> readTodos() async {
    final db = await database;
    final result = await db.query('todos');

    // Ubah hasil query (Map) ke dalam bentuk objek TodoItem
    return result.map((json) => TodoItem(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      isDone: (json['isDone'] as int) == 1,
    )).toList();
  }

  /// Mengupdate data todo berdasarkan ID
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

  /// Menghapus 1 todo berdasarkan ID
  Future<int> deleteTodo(int id) async {
    final db = await database;
    return await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Menghapus semua todo di tabel `todos`
  Future<void> deleteAllTodos() async {
    final db = await database;
    await db.delete('todos');
  }

  // =======================================================
  // 🕒 BAGIAN 2: CRUD UNTUK HISTORY
  // =======================================================

  /// Menambahkan 1 todo ke tabel history (biasanya setelah diselesaikan)
  Future<int> addToHistory(TodoItem item) async {
    final db = await database;
    return await db.insert('history', {
      'title': item.title,
      'description': item.description,
      'category': item.category,
      'isDone': item.isDone ? 1 : 0,
    });
  }

  /// Membaca semua data dari tabel history
  Future<List<TodoItem>> readHistory() async {
    final db = await database;
    final result = await db.query('history');

    return result.map((json) => TodoItem(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      isDone: (json['isDone'] as int) == 1,
    )).toList();
  }

  /// Menghapus 1 entri dari history berdasarkan ID
  Future<int> deleteHistory(int id) async {
    final db = await database;
    return await db.delete(
      'history',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Menghapus semua data di tabel `history`
  Future<void> deleteAllHistory() async {
    final db = await database;
    await db.delete('history');
  }

  // =======================================================
  // 🧹 UTILITAS TAMBAHAN
  // =======================================================

  /// Menghapus semua data (todos & history)
  Future<void> clearAllData() async {
    final db = await database;
    await db.delete('todos');
    await db.delete('history');
  }
}
