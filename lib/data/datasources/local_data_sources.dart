import 'package:tenis_club/data/model/booking_model.dart';
import 'package:tenis_club/data/model/court_model.dart';
import 'package:tenis_club/data/model/home_booking_model.dart';
import 'package:tenis_club/data/model/hour_model.dart';

abstract class LocalDatabase {
  Future<List<Court>> viewCourts();
  Future<List<Hour>> viewHours();
  Future<String> viewHour(String id);
  Future<List<Booking>> viewBooking();
  Future<List<Booking>> viewAvailableDate(DateTime dateSelected, Court court);
  Future<dynamic> insertBooking(Booking booking);
  Future<dynamic> deleteBooking(int id);
  Future<dynamic> updateBooking(Booking booking);
  Future<List<HomeBooking>>viewListBooking();
}
