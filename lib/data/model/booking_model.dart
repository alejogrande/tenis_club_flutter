class Booking {
  final int? id;
  final int? idHour;
  final int? idCourt;
  final DateTime? date;
  final String? icon;
  final int? grade;

  const Booking(
      { this.id,
      required this.date,
      required this.idCourt,
      required this.idHour,
      required this.grade,
      required this.icon});

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'date': date.toString(),
      'idCourt': idCourt,
      'idHour': idHour,
      'grade': grade,
      'icon': icon,
    };
  }

  @override
  String toString() {
    return 'hours{id: $id, date: $date, idCourt: $idCourt, idHour: $idHour,, grade: $grade, icon: $icon}';
  }
}
