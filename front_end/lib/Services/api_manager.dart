import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:hurry_up_henry/Constants/constants.dart';

// setting as abstract class to prevent from instantiation
abstract class APIManager {
  static getCarStatus() async {
    final response = await http.get(
      Uri.http(Constants.url, '/car/rotate'),
      headers: <String, String>{
        'Acept': 'application/json',
        'X-API-Key': Constants.apikey,
      },
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var carStatus = json.decode(jsonString);
      return carStatus;
    } else if (response.statusCode == 405) {
      print("invalid request");
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
      // notify the car ok to keep moving???
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
