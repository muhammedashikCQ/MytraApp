// To parse this JSON data, do
//
//     final serviceData = serviceDataFromJson(jsonString);

import 'dart:convert';

ServiceData serviceDataFromJson(String str) =>
    ServiceData.fromJson(json.decode(str));

String serviceDataToJson(ServiceData data) => json.encode(data.toJson());

class ServiceData {
  int? serviceId;
  String? serviceName;

  ServiceData({
    this.serviceId,
    this.serviceName,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        serviceId: json["serviceId"],
        serviceName: json["serviceName"],
      );

  Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "serviceName": serviceName,
      };
}
