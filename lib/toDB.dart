import 'package:sqflite/sqflite.dart';

class ToDB{
  final tabName = 'tabPlanning';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tabName(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      prof TEXT,
      matiere TEXT,
      dateReservation TEXT,
      dateHeuresCours TEXT,
      dureeCours INTEGER
    );""");
  }

  // Future<int> addData() async {
  //   final db = await createTable(database)
  //   return await db.insert($tabName, {});
  // }


}