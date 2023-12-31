class Hour {
  final int id;
  final String details;
   bool? visible;

   Hour({
    required this.id,
    required this.details,
    this.visible=true,
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
   Hour(id: 1001, details: "06:00-08:45"),
   Hour(id: 1002, details: "09:00-11:45"),
   Hour(id: 1003, details: "12:00-14:45"),
   Hour(id: 1004, details: "15:00-17:45"),
];
