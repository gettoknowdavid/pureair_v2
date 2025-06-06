import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pureair_v2/src/database/database_constants.dart';
import 'package:sqflite/sqflite.dart';

class PureAirDatabase {
  // Private constructor to enforce singleton pattern and controlled creation
  PureAirDatabase._create(this._database);

  /// The Sqflite Database instance for this app.
  final Database _database;

  /// Getter to expose the database instance.
  Database get database => _database;

  /// Create an instance of PureAirDatabase to use throughout the app.
  static Future<PureAirDatabase> create() async {
    // Get the application's documents directory
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'pureair_v2.db');

    // Open the database or create it if it doesn't exist
    final db = await openDatabase(
      path,
      version: 1,
      onCreate: _createDbSchema,
      onUpgrade: _onUpgradeDbSchema,
    );
    return PureAirDatabase._create(db);
  }

  // Static method to create the database schema (used by openDatabase)
  static Future<void> _createDbSchema(Database db, int version) async {
    // It's a good practice to drop tables only during development or specific
    // resets, not typically in onCreate unless you always want a fresh start.
    // For production, onCreate runs only once when the DB is first created.
    // await db.execute('DROP TABLE if EXISTS $tableCities');
    await db.execute('''
      CREATE TABLE $tableCities(
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $citiesColUid TEXT UNIQUE,
        $citiesColTime INTEGER,
        $citiesColAddedTime INTEGER,
        $citiesColName TEXT NOT NULL,
        $citiesColGeo TEXT, -- Store Geo as a JSON string
        $citiesColUrl TEXT,
        $citiesColLocation TEXT,
        $citiesColCountry TEXT,
        $citiesColIsLocal INTEGER, -- SQLite stores booleans as 0 or 1
        $citiesColAQI INTEGER,
        $citiesColFlagUrl TEXT,
        $citiesColLocaleName TEXT
      )
    ''');
  }

  // Static method to handle database schema upgrades
  static Future<void> _onUpgradeDbSchema(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    // This example simply recreates the schema if oldVersion < kVersion1.
    // In a real app, you'd add specific ALTER TABLE statements for each
    // version upgrade.
    if (oldVersion < kVersion1) {
      await _createDbSchema(db, newVersion);
    }
  }

  // Example method that uses the database
  // Note: saveCity (and other CRUD operations) would typically be in your 
  // Datasource, not directly in this database service. This service just 
  // provides the Database object.
  /*
  Future<void> saveCity(CityDto city) async {
    // This logic belongs in your datasource.
    // Also, if city.id.v is null, it usually means it's a new record.
    // SQLite's insert returns the new row ID.
    // city.id.v = await _database.insert(tableCities, city.toMap());
  }
  */

  /// Close the database connection.
  Future<void> close() async {
    await _database.close();
  }
}
