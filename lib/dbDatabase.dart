/*
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

*/
/*
class PlanningModel {
  int id;
  String prof;
  *//*
*/
/*String matiere;
  DateTime dateReservation;
  DateTime dateHeuresCours;
  int dureeCours;*//*
*/
/*

  PlanningModel({required this.id, required this.prof});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'prof': prof
    };
  }
}*//*


void main() async {
  var tabName = 'tabPlanning';
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'planning_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE $tabName(id INTEGER PRIMARY KEY, prof TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  // Define a function that inserts dogs into the database
  Future<void> insertPlanning(PlanningModel planningModel) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      tabName,
      planningModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<PlanningModel>> plannings() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query(tabName);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return PlanningModel(
        id: maps[i]['id'],
        prof: maps[i]['prof']
      );
    });
  }

  Future<void> updatePlanning(PlanningModel planningModel) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      tabName,
      planningModel.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [planningModel.id],
    );
  }

  Future<void> deletePlanning(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      tabName,
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }


  // Create a Dog and add it to the dogs table
  var fido = PlanningModel(
    id: 0,
    prof: 'Fido'
  );

  await insertPlanning(fido);
  
  print(await plannings());

}*/
