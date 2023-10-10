import 'package:app/planningModel.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';


class DbPlanning{
  var tabName = 'tabplanning';
  DbPlanning._();

  static final DbPlanning instance =  DbPlanning._();
  static Database? _database;

  Future<Database> get database async{
    if(_database != null) return _database!;
    if (kDebugMode) {
      print('***DATABASE***$_database');
    }
    _database = await initDB();
    if (kDebugMode) {
      print('***RETURN***$_database');
    }
    return _database!;
  }


  initDB() async{
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(), 'dbplanning1.db'),
      onCreate: (db, version){
        return db.execute(
          'CREATE TABLE $tabName(id INTEGER NOT NULL AUTOINCREMENT PRIMARY KEY, prof TEXT, matiere TEXT, dateReservation TEXT, dateHeuresCours TEXT, dureeCours INTEGER)'
        );
      },
      version: 1,
    );
  }

  void insertPlanning(PlanningModel planningModel) async{
    if (kDebugMode) {
      print('*** INSERT *** $planningModel');
    }
    final Database db = await database;
    await db.insert(
        tabName ,
        planningModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  void updatePlanning(PlanningModel planningModel) async{
    final Database db = await database;
    await db.update(
        tabName ,
        planningModel.toMap(),
        where: "id = ?", whereArgs: [planningModel.id]
    );
  }

  void deletePlanning(int id) async{
    final Database db = await database;
    db.delete(tabName, where: "id = ?", whereArgs: [id]);
  }

  Future<List<PlanningModel>> listPlannings() async{
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tabName);
    List<PlanningModel> listPlannings = List.generate(maps.length, (i) {
      return PlanningModel.fromMap(maps[i]);
    });

    if(listPlannings.isEmpty){
      for(PlanningModel planningModel in defaultPlanning){
        insertPlanning(planningModel);
      }
      listPlannings = defaultPlanning;
    }
    return listPlannings;
  }

  final List<PlanningModel> defaultPlanning = [
    PlanningModel(
        1,
        'Mohamed Youssfi',
        'Java',
        DateTime.now().toString(),
        DateTime.now().toString(),
        4
    ),
    PlanningModel(
        2,
        'Romeo',
        'IA',
        DateTime.now().toString(),
        DateTime.now().toString(),
        2
    ),
    PlanningModel(
        3,
        'Herizo',
        'Scrum Master',
        DateTime.now().toString(),
        DateTime.now().toString(),
        4
    ),
    PlanningModel(
        4,
        'Bary',
        'Marcher public',
        DateTime.now().toString(),
        DateTime.now().toString(),
        2
    ),
    PlanningModel(
        5,
        'Hasina',
        'Python',
        DateTime.now().toString(),
        DateTime.now().toString(),
        4
    ),
    PlanningModel(
        6,
        'Fano',
        'Monitoring',
        DateTime.now().toString(),
        DateTime.now().toString(),
        4
    ),
  ];

}

/*class DbPlanning{
  Database? _database;

  Future<Database> get database async {
    if(_database != null){
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'dbdatabe.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true
    );
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await ToDB().createTable(database);


  void insertPlanning(PlanningModel planningModel) async {
    final Database db = await database;

    await db.insert(
        'tabPlanning',
        planningModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  *//*Future<List<PlanningModel>> planningModels() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tabPlanning');
    List<PlanningModel> plannings = List.generate(maps.length, (i) => {
      return PlanningModel(
        id: maps[i]['id'],
        prof: maps[i]['prof'],
        matiere: maps[i]['matiere'],
        dateReservation: maps[i]['dateReservation'],
        dateHeuresCours: maps[i]['dateHeuresCours'],
        dureeCours: maps[i]['dureeCours'],
    );
    });*//*
  // }
}*/

