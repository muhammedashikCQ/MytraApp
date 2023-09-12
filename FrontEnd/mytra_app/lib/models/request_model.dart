// To parse this JSON data, do
//
//     final requestData = requestDataFromJson(jsonString);

import 'dart:convert';

RequestData requestDataFromJson(String str) =>
    RequestData.fromJson(json.decode(str));

String requestDataToJson(RequestData data) => json.encode(data.toJson());

class RequestData {
  List<int>? serviceId;
  int? userId;
  int? locationId;
  String? buildingName;
  String? description;

  RequestData({
    this.serviceId,
    this.userId,
    this.locationId,
    this.buildingName,
    this.description,
  });

  factory RequestData.fromJson(Map<String, dynamic> json) => RequestData(
        serviceId: List<int>.from(json["serviceId"].map((x) => x)),
        userId: json["userId"],
        locationId: json["locationId"],
        buildingName: json["buildingName"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "serviceId": List<dynamic>.from(serviceId!.map((x) => x)),
        "userId": userId,
        "locationId": locationId,
        "buildingName": buildingName,
        "description": description,
      };
}
