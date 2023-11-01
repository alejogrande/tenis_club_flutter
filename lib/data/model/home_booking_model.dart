import 'package:tenis_club/data/model/court_model.dart';
import 'package:tenis_club/data/model/hour_model.dart';

class HomeBooking {
  final int? id;
  final Hour? hour;
  final Court? court;
  final DateTime? date;
  final String? icon;
  final String? grade;
  final String? name;

  const HomeBooking(
      { this.id,
      required this.date,
      required this.court,
      required this.hour,
      required this.grade,
      required this.icon,
      required this.name});

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'date': date.toString(),
      'idCourt': court,
      'idHour': hour,
      'grade': grade,
      'icon': icon,
      'name':name,
    };
  }
}