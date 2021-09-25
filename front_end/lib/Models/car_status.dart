// To parse this JSON data, do
//
//     final carStatus = carStatusFromJson(jsonString);

import 'dart:convert';

CarStatus carStatusFromJson(String str) => CarStatus.fromJson(json.decode(str));

String carStatusToJson(CarStatus data) => json.encode(data.toJson());

class CarStatus {
  CarStatus({
    required this.name,
    required this.status,
  });

  String name;
  String status;

  factory CarStatus.fromJson(Map<String, dynamic> json) => CarStatus(
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
      };
}
