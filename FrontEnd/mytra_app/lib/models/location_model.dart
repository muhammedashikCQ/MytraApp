// To parse this JSON data, do
//
//     final locationData = locationDataFromJson(jsonString);

import 'dart:convert';

List<LocationData> locationDataFromJson(String str) => List<LocationData>.from(
    json.decode(str).map((x) => LocationData.fromJson(x)));

String locationDataToJson(List<LocationData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationData {
  int? locationId;
  String? locationName;

  LocationData({
    this.locationId,
    this.locationName,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
        locationId: json["locationId"],
        locationName: json["locationName"],
      );

  Map<String, dynamic> toJson() => {
        "locationId": locationId,
        "locationName": locationName,
      };
}
