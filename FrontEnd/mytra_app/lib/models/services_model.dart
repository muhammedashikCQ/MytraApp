// To parse this JSON data, do
//
//     final servicesData = servicesDataFromJson(jsonString);

import 'dart:convert';

List<ServicesData> servicesDataFromJson(String str) => List<ServicesData>.from(
    json.decode(str).map((x) => ServicesData.fromJson(x)));

String servicesDataToJson(List<ServicesData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicesData {
  int? serviceId;
  String? serviceName;

  ServicesData({
    this.serviceId,
    this.serviceName,
  });

  factory ServicesData.fromJson(Map<String, dynamic> json) => ServicesData(
        serviceId: json["serviceId"],
        serviceName: json["serviceName"],
      );

  Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "serviceName": serviceName,
      };
}
