import 'package:tenis_club/data/model/booking_model.dart';
import 'package:tenis_club/data/model/court_model.dart';
import 'package:tenis_club/data/model/hour_model.dart';

abstract class LocalDatabase {
  Future<List<Court>> viewCourts();
  Future<List<Hour>> viewHours();
  Future<List<Booking>> viewBooking();
  Future<List<Booking>> viewAvailableDate(DateTime dateSelected, Court court);
  Future<dynamic> insertBooking(Booking booking);
  Future<dynamic> deleteBooking(Booking booking);
  Future<dynamic> updateBooking(Booking booking);
}
