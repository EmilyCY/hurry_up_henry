import 'dart:convert';

class CarRotation {
  final String isRotation;

  CarRotation({required this.isRotation});

  factory CarRotation.fromJson(Map<String, dynamic> json) => CarRotation(isRotation: 'isrotation',);
}
