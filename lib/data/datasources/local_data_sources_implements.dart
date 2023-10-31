import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tenis_club/data/datasources/local_data_sources.dart';
import 'package:tenis_club/data/model/booking_model.dart';
import 'package:tenis_club/data/model/court_model.dart';
import 'package:tenis_club/data/model/hour_model.dart';
import 'package:tenis_club/utils/constans.dart';

List<String> queryCreateTables = [
  DataBase.createTableCourt,
  DataBase.createTablehour,
  DataBase.createTableBooking
];

class LocalDataSourceImplement implements LocalDatabase {
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Database db = await openDatabase(
      join(await getDatabasesPath(), 'booking.db'),
      onCreate: (db, version) {
        for (var query in queryCreateTables) {
          db.execute(query);
        }
        return;
      },
      version: 1,
    );

    await insertHours(db, schedule);
    await insertCourts(db, courts);
    return db;
  }

  Future<void> insertHours(Database db, List<Hour> listHours) async {
    for (var element in listHours) {
      await db.insert(
        'hour',
        element.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> insertCourts(Database db, List<Court> listCourts) async {
    for (var element in listCourts) {
      await db.insert(
        'court',
        element.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Hour>> viewHours() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('hour');

    return List.generate(maps.length, (i) {
      return Hour(
        id: maps[i]['id'],
        details: maps[i]['details'],
      );
    });
  }

  Future<List<Court>> viewCourts() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('court');

    return List.generate(maps.length, (i) {
      return Court(
        id: maps[i]['id'],
        name: maps[i]['name'],
        details: maps[i]['details'],
        size: maps[i]['size'],
        image: maps[i]['image'],
      );
    });
  }

  @override
  Future deleteBooking(Booking booking) {
    // TODO: implement deleteBooking
    throw UnimplementedError();
  }

  @override
  Future insertBooking(Booking booking) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('booking');

    await db.insert(
      'booking',
      booking.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
var a = viewBooking();
    print(viewBooking().toString());
  }

  @override
  Future updateBooking(Booking booking) {
    // TODO: implement updateBooking
    throw UnimplementedError();
  }

  @override
  Future<List<Booking>> viewAvailableDate(DateTime dateSelected, Court court) {
    // TODO: implement viewAvailableDate
    throw UnimplementedError();
  }

  @override
  Future<List<Booking>> viewBooking() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('booking');

    return List.generate(maps.length, (i) {
      return Booking(
        id: maps[i]['id'],
        date: DateTime.parse(maps[i]['date']),
        grade: maps[i]['grade'],
        idCourt: maps[i]['idCourt'],
        idHour: maps[i]['idHour'],
        icon: maps[i]['icon'],
      );
    });
  }
}
