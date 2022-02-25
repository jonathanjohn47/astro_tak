// To parse this JSON data, do
//
//     final questionCategoriesApiResponseModel = questionCategoriesApiResponseModelFromJson(jsonString);

import 'dart:convert';

QuestionCategoriesApiResponseModel questionCategoriesApiResponseModelFromJson(
        String str) =>
    QuestionCategoriesApiResponseModel.fromJson(json.decode(str));

String questionCategoriesApiResponseModelToJson(
        QuestionCategoriesApiResponseModel data) =>
    json.encode(data.toJson());

class QuestionCategoriesApiResponseModel {
  QuestionCategoriesApiResponseModel({
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

  factory QuestionCategoriesApiResponseModel.fromJson(
          Map<String, dynamic> json) =>
      QuestionCategoriesApiResponseModel(
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

  factory QuestionCategoriesApiResponseModel.empty() =>
      QuestionCategoriesApiResponseModel(
        httpStatus: "",
        httpStatusCode: 0,
        success: false,
        message: "",
        apiName: "",
        data: [],
      );
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.suggestions,
  });

  final int id;
  final String name;
  final String description;
  final double price;
  final List<String> suggestions;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"] == null ? '' : json["description"],
        price: json["price"],
        suggestions: List<String>.from(json["suggestions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description == null ? null : description,
        "price": price,
        "suggestions": List<dynamic>.from(suggestions.map((x) => x)),
      };
}
