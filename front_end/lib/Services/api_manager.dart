import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:hurry_up_henry/Constants/constants.dart';
import 'package:hurry_up_henry/Models/car_status.dart';

// setting as abstract class to prevent from instantiation
abstract class APIManager {
  static Future<CarStatus> getCarStatus() async {
    final response = await http.get(
      Uri.http(Constants.url, '/car/status'),
      headers: <String, String>{
        'Acept': 'application/json',
        'X-API-Key': Constants.apikey,
      },
    );
    if (response.statusCode == 200) {
      var jsonString = response.body.replaceAll('\'', '\"');
      print(jsonString); // for testing
      return carStatusFromJson(jsonString);
    } else {
      throw Exception('Failed to get car status');
    }
  }

  static void postRotatDrive(bool isClockwise) async {
    final response = await http.post(
      Uri.http(Constants.url, '/car/rotate'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'X-API-Key': Constants.apikey,
      },
      body: jsonEncode(<String, bool>{
        'clockwise': isClockwise,
      }),
    );
    if (response.statusCode == 200) {
      print("rotation successful"); // for testing
      postDrive();
      // notify the getcurrent position  ok to keep moving???
    } else {
      throw Exception('Failed to rotate the car.');
    }
  }

  static void postDrive() async {
    final response = await http.post(
      Uri.http(Constants.url, '/car/drive'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'X-API-Key': Constants.apikey,
      },
    );
    if (response.statusCode == 200) {
      print("drive successful");
    } else {
      throw Exception('Failed to drive the car.');
    }
  }

  static void postReverse() async {
    final response = await http.post(
      Uri.http(Constants.url, '/car/reverse'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'X-API-Key': Constants.apikey,
      },
    );
    if (response.statusCode == 200) {
      print("drive successful");
    } else {
      throw Exception('Failed to drive the car.');
    }
  }
}
