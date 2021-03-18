import 'package:app5_qr_scanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBPRovider {
  static Database _database;

  static final DBPRovider db = DBPRovider._();
  
  DBPRovider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    //Ruta donde se va almacenar la db
    var documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'scans.db');
    print(path);

    //Creacion de la db
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          );
        ''');
      },
    );
  }

  nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;
    final db = await database;
    final resp = await db.rawInsert('''
      INSERT INTO scans(id, tipo, valor)
        VALUES ($id, '$tipo', '$valor')
    ''');

    return resp;
  }

  nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final resp = await db.insert('scans', nuevoScan.toJson());

    return resp;
  }

  Future<ScanModel> obtenerScan(int id) async {
    final db = await database;
    final resp = await db.query('scans', where: 'id = ?', whereArgs: [id]);

    return resp.isNotEmpty
      ? ScanModel.fromJson(resp.first)
      : null;
  }

  Future<List<ScanModel>> obtenerScansTipo(String tipo) async {
    final db = await database;
    final resp = await db.query('scans', where: 'tipo = ?', whereArgs: [tipo]);

    return resp.isNotEmpty
      ? resp.map((e) => ScanModel.fromJson(e)).toList()
      : [];
  }
  
  Future<List<ScanModel>> obtenerScansTodos() async {
    final db = await database;
    final resp = await db.query('scans');

    return resp.isNotEmpty
      ? resp.map((e) => ScanModel.fromJson(e)).toList()
      : [];
  }

  Future<int> actualizarScan(ScanModel scan) async {
    final db = await database;
    final resp = await db.update('scans', scan.toJson(), where: 'id = ?', whereArgs: [scan.id]);

    return resp;
  }

  Future<int> borrarScan(int id) async {
    final db = await database;
    final resp = await db.delete('scans', where: 'id = ?', whereArgs: [id]);

    return resp;
  }

  Future<int> borrarTodosScans() async {
    final db = await database;
    final resp = await db.delete('scans');

    return resp;
  }
}