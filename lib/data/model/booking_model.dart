class Booking {
  final int? id;
  final int? idHour;
  final int? idCourt;
  final DateTime? date;
  final String? icon;
  final String? grade;
  final String? name;

  const Booking(
      { this.id,
      required this.date,
      required this.idCourt,
      required this.idHour,
      required this.grade,
      required this.icon,
      required this.name});

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'date': date.toString(),
      'idCourt': idCourt,
      'idHour': idHour,
      'grade': grade,
      'icon': icon,
      'name':name,
    };
  }

  @override
  String toString() {
    return 'hours{id: $id, date: $date, idCourt: $idCourt, idHour: $idHour, grade: $grade, icon: $icon}';
  }
}
