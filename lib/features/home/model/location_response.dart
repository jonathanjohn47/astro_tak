// To parse this JSON data, do
//
//     final locationResponse = locationResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LocationResponse locationResponseFromJson(String str) => LocationResponse.fromJson(json.decode(str));

String locationResponseToJson(LocationResponse data) => json.encode(data.toJson());

class LocationResponse {
  LocationResponse({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.apiName,
    required this.data,
  });

  final String httpStatus;
  final int httpStatusCode;
  final bool success;
  final String message;
  final String apiName;
  final List<Datum> data;

  factory LocationResponse.fromJson(Map<String, dynamic> json) => LocationResponse(
    httpStatus: json["httpStatus"],
    httpStatusCode: json["httpStatusCode"],
    success: json["success"],
    message: json["message"],
    apiName: json["apiName"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "httpStatus": httpStatus,
    "httpStatusCode": httpStatusCode,
    "success": success,
    "message": message,
    "apiName": apiName,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.placeName,
    required this.placeId,
  });

  final String placeName;
  final String placeId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    placeName: json["placeName"],
    placeId: json["placeId"],
  );

  Map<String, dynamic> toJson() => {
    "placeName": placeName,
    "placeId": placeId,
  };
}
