import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotificationDbHelper {
  static const String _dbName = 'notifications.db';
  static const int _dbVersion = 1;

  static const String table = 'notifications';
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnBody = 'body';
  static const String columnDate = 'date';
  static const String columnIsRead =
      'isRead'; // Columna para saber si la notificación ha sido leída

  // Obtiene una instancia de la base de datos
  Future<Database> _database() async {
    var dbPath = await getDatabasesPath();
    var path = join(dbPath, _dbName);
    return openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  // Crea la tabla
  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTitle TEXT,
        $columnBody TEXT,
        $columnDate TEXT
      )
    ''');
  }

  // Inserta una nueva notificación
  Future<int> insertNotification(Map<String, dynamic> notification) async {
    Database db = await _database();
    return await db.insert(table, notification);
  }

  // Obtiene todas las notificaciones
  Future<List<Map<String, dynamic>>> getAllNotifications() async {
    Database db = await _database();
    return await db.query(table, orderBy: '$columnDate DESC');
  }

  // Obtener las notificaciones no leídas
  Future<List<Map<String, dynamic>>> getUnreadNotifications() async {
    Database db = await _database();
    return await db.query(
      table,
      where: '$columnIsRead = 0',
    );
  }

  // Función para obtener un Stream de notificaciones no leídas
  Stream<int> getUnreadNotificationsCount() async* {
    // Aquí generamos un Stream que emite la cantidad de notificaciones no leídas
    while (true) {
      var notifications = await getUnreadNotifications();
      yield notifications.length;
      await Future.delayed(Duration(seconds: 1)); // Actualiza cada segundo
    }
  }

  // Elimina una notificación por ID
  Future<int> deleteNotification(int id) async {
    Database db = await _database();
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
