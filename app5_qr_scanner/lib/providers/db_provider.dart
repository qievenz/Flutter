import 'package:sqflite/sqflite.dart';

class DBPRovider {
  static Database _database;

  static final DBPRovider db = DBPRovider._();
  
  DBPRovider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() {

  }
}