import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:hurry_up_henry/Constants/constants.dart';
import 'package:hurry_up_henry/Models/car_rotation.dart';
import 'package:hurry_up_henry/Models/car_status.dart';

class APIManager {
  getCarStatus() async {
    final response = await http.get(Constants.apiUrl);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var carStatus = json.decode(jsonString);
      return carStatus;
    } else {
      throw Exception('Failed to get car status');
    }
  }

  Future<CarRotation> postRotation(bool isClockwise) async {
    final response = await http.post(
      Constants.apiUrl,
      headers: <String, String>{
        '': '',
      },
      body: jsonEncode(<String, String>{
        '': '',
      }),
    );

    if (response.statusCode == 201) {
      return CarRotation.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to turn the car.');
    }
  }
}
