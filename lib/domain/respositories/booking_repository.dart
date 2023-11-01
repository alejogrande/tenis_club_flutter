import 'package:tenis_club/data/datasources/local_data_sources.dart';
import 'package:tenis_club/data/model/booking_model.dart';
import 'package:tenis_club/data/model/court_model.dart';
import 'package:tenis_club/data/model/hour_model.dart';

class BookingRepository {
  final LocalDatabase database;

  const BookingRepository(this.database);

  Future deleteBooking({required int id}) async {
    final response = await database.deleteBooking(id);
    return response;
  }

  Future<List<Booking>> getAvailableDate(
      DateTime dateSelected, Court court) async {
    final response = await database.viewAvailableDate(dateSelected, court);
    return response;
  }

  Future<List<Booking>> getBooking() async {
    final response = await database.viewBooking();
    return response;
  }

  Future<List<Court>> getCourts() async {
    final response = await database.viewCourts();
    return response;
  }

  Future<List<Hour>> getHours() async {
    final response = await database.viewHours();
    return response;
  }

  Future<String> getHourbyId(String id) async {
    final response = await database.viewHour(id);
    return response;
  }

  Future setBooking(Booking booking) async {
    final response = await database.insertBooking(booking);
    return response;
  }

  Future updateBooking(Booking booking) async {
    final response = await database.updateBooking(booking);
    return response;
  }

  Future getListHomeBooking() async {
    final response = await database.viewListBooking();
    return response;
  }
}
