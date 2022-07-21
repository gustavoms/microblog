import 'package:sqflite/sqflite.dart';

class MicroblogDatabase {
  late Database _database;
  Database get instance => _database;

  MicroblogDatabase() {
    _getInstance();
  }

  Future<void> _getInstance() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + "microblog.db";

    Database database = await openDatabase(path, version: 1, onCreate: (
      Database db,
      int version,
    ) async {
      await db.execute(
        'CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT);',
      );
      await db.execute(
        'CREATE TABLE post (id INTEGER PRIMARY KEY, user_id INTEGER, post TEXT, date TEXT, FOREIGN KEY(user_id) REFERENCES artist(id));',
      );
    });

    _database = database;
  }

  Future<void> close() async {
    await _database.close();
  }
}
