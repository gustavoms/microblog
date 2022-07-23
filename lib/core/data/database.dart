import 'package:sqflite/sqflite.dart';

class MicroblogDatabase {
  late Database _database;

  Future<Database> getInstance() async {
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

      await db.execute(
          "insert into user (name, email, password) values ('João S. S.', 'joaodasilva@gmail.com', 'a1b2c3d4')");
      await db.execute(
          "insert into user (name, email, password) values ('Adelmar F. J.', 'adelmar@gmail.com', 'a1b2c3d4')");
      await db.execute(
          "insert into user (name, email, password) values ('Jucelino B.', 'joaodasilva@gmail.com', 'a1b2c3d4')");
      await db.execute(
          "insert into user (name, email, password) values ('Avelino A.', 'joaodasilva@gmail.com', 'a1b2c3d4')");
      await db.execute(
          "insert into user (name, email, password) values ('Rivaldo B.', 'joaodasilva@gmail.com', 'a1b2c3d4')");
      await db.execute(
          "insert into user (name, email, password) values ('Rogerio F.', 'joaodasilva@gmail.com', 'a1b2c3d4')");
      await db.execute(
          "insert into user (name, email, password) values ('Igor F.', 'joaodasilva@gmail.com', 'a1b2c3d4')");

      await db.execute(
          "insert into post (user_id, post, date) values (1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eu lorem hendrerit, rhoncus metus tempus, interdum metus. Nunc ullamcorper sem sit amet elit dapibus hendrerit. Donec sed sem at neque pretium dapibus et ut mi. Nullam dapibus, sit amet accumsan ligula euismod ut.', '2022-07-22T23:07:34')");
      await db.execute(
          "insert into post (user_id, post, date) values (2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eu lorem hendrerit, rhoncus metus tempus, interdum metus. Nunc ullamcorper sem sit amet elit dapibus hendrerit. Donec sed sem at neque pretium dapibus et ut mi. Nullam dapibus, sit amet accumsan ligula euismod ut.', '2022-07-22T20:07:34')");
      await db.execute(
          "insert into post (user_id, post, date) values (3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eu lorem hendrerit, rhoncus metus tempus, interdum metus. Nunc ullamcorper sem sit amet elit dapibus hendrerit. Donec sed sem at neque pretium dapibus et ut mi. Nullam dapibus, sit amet accumsan ligula euismod ut.', '2022-07-22T21:07:34')");
      await db.execute(
          "insert into post (user_id, post, date) values (4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eu lorem hendrerit, rhoncus metus tempus, interdum metus. Nunc ullamcorper sem sit amet elit dapibus hendrerit. Donec sed sem at neque pretium dapibus et ut mi. Nullam dapibus, sit amet accumsan ligula euismod ut.', '2022-07-22T13:07:34')");
      await db.execute(
          "insert into post (user_id, post, date) values (5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eu lorem hendrerit, rhoncus metus tempus, interdum metus. Nunc ullamcorper sem sit amet elit dapibus hendrerit. Donec sed sem at neque pretium dapibus et ut mi. Nullam dapibus, sit amet accumsan ligula euismod ut.', '2022-07-22T15:07:34')");
      await db.execute(
          "insert into post (user_id, post, date) values (6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eu lorem hendrerit, rhoncus metus tempus, interdum metus. Nunc ullamcorper sem sit amet elit dapibus hendrerit. Donec sed sem at neque pretium dapibus et ut mi. Nullam dapibus, sit amet accumsan ligula euismod ut.', '2022-07-22T16:07:34')");
      await db.execute(
          "insert into post (user_id, post, date) values (7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eu lorem hendrerit, rhoncus metus tempus, interdum metus. Nunc ullamcorper sem sit amet elit dapibus hendrerit. Donec sed sem at neque pretium dapibus et ut mi. Nullam dapibus, sit amet accumsan ligula euismod ut.', '2022-07-22T18:07:34')");
    });

    _database = database;
    return database;
  }

  Future<void> close() async {
    await _database.close();
  }
}
