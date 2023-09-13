// To parse this JSON data, do
//
//     final previousOrdersData = previousOrdersDataFromJson(jsonString);

import 'dart:convert';

List<PreviousOrdersData> previousOrdersDataFromJson(String str) =>
    List<PreviousOrdersData>.from(
        json.decode(str).map((x) => PreviousOrdersData.fromJson(x)));

String previousOrdersDataToJson(List<PreviousOrdersData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PreviousOrdersData {
  int? orderId;
  int? userId;
  Location? location;
  List<Service>? service;
  String? buildingName;
  String? description;

  PreviousOrdersData({
    this.orderId,
    this.userId,
    this.location,
    this.service,
    this.buildingName,
    this.description,
  });

  factory PreviousOrdersData.fromJson(Map<String, dynamic> json) =>
      PreviousOrdersData(
        orderId: json["orderId"],
        userId: json["userId"],
        location: Location.fromJson(json["location"]),
        service:
            List<Service>.from(json["service"].map((x) => Service.fromJson(x))),
        buildingName: json["buildingName"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "userId": userId,
        "location": location!.toJson(),
        "service": List<dynamic>.from(service!.map((x) => x.toJson())),
        "buildingName": buildingName,
        "description": description,
      };
}

class Location {
  int? locationId;
  String? locationName;

  Location({
    this.locationId,
    this.locationName,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        locationId: json["locationId"],
        locationName: json["locationName"],
      );

  Map<String, dynamic> toJson() => {
        "locationId": locationId,
        "locationName": locationName,
      };
}

class Service {
  int? serviceId;
  String? serviceName;

  Service({
    this.serviceId,
    this.serviceName,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceId: json["serviceId"],
        serviceName: json["serviceName"],
      );

  Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "serviceName": serviceName,
      };
}
