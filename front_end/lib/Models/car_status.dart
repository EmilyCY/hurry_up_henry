import 'dart:convert';

CarStatus carStatusFromJson(String str) => CarStatus.fromJson(json.decode(str));

String carStatusToJson(CarStatus data) => json.encode(data.toJson());

class CarStatus {
  String name;
  String status;

  CarStatus({
    required this.name,
    required this.status,
  });

  factory CarStatus.fromJson(Map<String, dynamic> json) => CarStatus(
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
      };

  fetchStatus() {
    return status;
  }
}
