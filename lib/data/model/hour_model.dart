class Hour {
  final int id;
  final String details;

  const Hour({
    required this.id,
    required this.details,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'details': details,
    };
  }

  @override
  String toString() {
    return 'hours{id: $id, details: $details}';
  }
}

List<Hour> schedule = [
  const Hour(id: 1001, details: "7:00 - 8:45"),
  const Hour(id: 1002, details: "9:00 - 10:45"),
  const Hour(id: 1003, details: "11:00 - 12:45"),
  const Hour(id: 1004, details: "13:00 - 14:45"),
  const Hour(id: 1005, details: "15:00 - 16:45"),
];
