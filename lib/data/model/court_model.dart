

import 'package:tenis_club/utils/constans.dart';

class Court {
  final int id;
  final String name;
  final String size;
  final String details;
  final String image;

  const Court(
      {required this.id,
      required this.details,
      required this.size,
      required this.image,
      required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'size': size,
      'details': details,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'court {id: $id, name: $name,size: $size,details: $details,image: $image';
  }
}

List<Court> courts = [
  const Court(
      id: 2001,
      name: "A",
      size: "34,74 x 17,07 mts",
      details: "Recreativa",
      image: Assets.courtRecreative),
  const Court(
      id: 2002,
      name: "B",
      size: "36,57 x 18,29 mts",
      details: "Entrenamiento",
      image: Assets.courtTraining),
  const Court(
      id: 2003,
      name: "C",
      size: "40,23 x 20,11 mts",
      details: "Profesional",
      image: Assets.courtProfessional)
];
