// To parse this JSON data, do
//
//     final addNewRelativeResponse = addNewRelativeResponseFromJson(jsonString);

import 'dart:convert';

AddNewRelativeResponse addNewRelativeResponseFromJson(String str) =>
    AddNewRelativeResponse.fromJson(json.decode(str));

String addNewRelativeResponseToJson(AddNewRelativeResponse data) =>
    json.encode(data.toJson());

class AddNewRelativeResponse {
  AddNewRelativeResponse({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.apiName,
  });

  final String httpStatus;
  final int httpStatusCode;
  final bool success;
  final String message;
  final String apiName;

  factory AddNewRelativeResponse.fromJson(Map<String, dynamic> json) =>
      AddNewRelativeResponse(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
      };
}

// To parse this JSON data, do
//
//     final addNewRelativeRequest = addNewRelativeRequestFromJson(jsonString);

AddNewRelativeRequest addNewRelativeRequestFromJson(String str) =>
    AddNewRelativeRequest.fromJson(json.decode(str));

String addNewRelativeRequestToJson(AddNewRelativeRequest data) =>
    json.encode(data.toJson());

class AddNewRelativeRequest {
  AddNewRelativeRequest({
    required this.birthDetails,
    required this.birthPlace,
    required this.firstName,
    required this.lastName,
    required this.relationId,
    required this.gender,
  });

  final BirthDetails birthDetails;
  final BirthPlace birthPlace;
  final String firstName;
  final String lastName;
  final int relationId;
  final String gender;

  factory AddNewRelativeRequest.fromJson(Map<String, dynamic> json) =>
      AddNewRelativeRequest(
        birthDetails: BirthDetails.fromJson(json["birthDetails"]),
        birthPlace: BirthPlace.fromJson(json["birthPlace"]),
        firstName: json["firstName"],
        lastName: json["lastName"],
        relationId: json["relationId"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "birthDetails": birthDetails.toJson(),
        "birthPlace": birthPlace.toJson(),
        "firstName": firstName,
        "lastName": lastName,
        "relationId": relationId,
        "gender": gender,
      };
}

class BirthDetails {
  BirthDetails({
    required this.dobDay,
    required this.dobMonth,
    required this.dobYear,
    required this.tobHour,
    required this.tobMin,
    required this.meridiem,
  });

  final int dobDay;
  final int dobMonth;
  final int dobYear;
  final int tobHour;
  final int tobMin;
  final String meridiem;

  factory BirthDetails.fromJson(Map<String, dynamic> json) => BirthDetails(
        dobDay: json["dobDay"],
        dobMonth: json["dobMonth"],
        dobYear: json["dobYear"],
        tobHour: json["tobHour"],
        tobMin: json["tobMin"],
        meridiem: json["meridiem"],
      );

  Map<String, dynamic> toJson() => {
        "dobDay": dobDay,
        "dobMonth": dobMonth,
        "dobYear": dobYear,
        "tobHour": tobHour,
        "tobMin": tobMin,
        "meridiem": meridiem,
      };
}

class BirthPlace {
  BirthPlace({
    required this.placeName,
    required this.placeId,
  });

  final String placeName;
  final String placeId;

  factory BirthPlace.fromJson(Map<String, dynamic> json) => BirthPlace(
        placeName: json["placeName"],
        placeId: json["placeId"],
      );

  Map<String, dynamic> toJson() => {
        "placeName": placeName,
        "placeId": placeId,
      };
}
