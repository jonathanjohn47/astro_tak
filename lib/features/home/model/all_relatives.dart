// To parse this JSON data, do
//
//     final allRelatives = allRelativesFromJson(jsonString);

import 'dart:convert';

AllRelatives allRelativesFromJson(String str) =>
    AllRelatives.fromJson(json.decode(str));

String allRelativesToJson(AllRelatives data) => json.encode(data.toJson());

class AllRelatives {
  AllRelatives({
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
  final Data data;

  factory AllRelatives.fromJson(Map<String, dynamic> json) => AllRelatives(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.pageNo,
    required this.numberOfElements,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.allRelatives,
  });

  final int pageNo;
  final int numberOfElements;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final List<AllRelative> allRelatives;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageNo: json["pageNo"],
        numberOfElements: json["numberOfElements"],
        pageSize: json["pageSize"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        allRelatives: List<AllRelative>.from(
            json["allRelatives"].map((x) => AllRelative.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageNo": pageNo,
        "numberOfElements": numberOfElements,
        "pageSize": pageSize,
        "totalElements": totalElements,
        "totalPages": totalPages,
        "allRelatives": List<dynamic>.from(allRelatives.map((x) => x.toJson())),
      };
}

class AllRelative {
  AllRelative({
    required this.uuid,
    required this.relation,
    required this.relationId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.fullName,
    required this.gender,
    required this.dateAndTimeOfBirth,
    required this.birthDetails,
    required this.birthPlace,
  });

  final String uuid;
  final String relation;
  final int relationId;
  final String firstName;
  final String middleName;
  final String lastName;
  final String fullName;
  final String gender;
  final DateTime dateAndTimeOfBirth;
  final BirthDetails birthDetails;
  final BirthPlace birthPlace;

  factory AllRelative.fromJson(Map<String, dynamic> json) => AllRelative(
        uuid: json["uuid"],
        relation: json["relation"],
        relationId: json["relationId"],
        firstName: json["firstName"],
        middleName: json["middleName"] ?? '',
        lastName: json["lastName"],
        fullName: json["fullName"],
        gender: json["gender"],
        dateAndTimeOfBirth: DateTime.parse(json["dateAndTimeOfBirth"]),
        birthDetails: BirthDetails.fromJson(json["birthDetails"]),
        birthPlace: BirthPlace.fromJson(json["birthPlace"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "relation": relation,
        "relationId": relationId,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "fullName": fullName,
        "gender": gender,
        "dateAndTimeOfBirth": dateAndTimeOfBirth.toIso8601String(),
        "birthDetails": birthDetails.toJson(),
        "birthPlace": birthPlace.toJson(),
      };
}

class BirthDetails {
  BirthDetails({
    required this.dobYear,
    required this.dobMonth,
    required this.dobDay,
    required this.tobHour,
    required this.tobMin,
    required this.meridiem,
  });

  final int dobYear;
  final int dobMonth;
  final int dobDay;
  final int tobHour;
  final int tobMin;
  final String meridiem;

  factory BirthDetails.fromJson(Map<String, dynamic> json) => BirthDetails(
        dobYear: json["dobYear"],
        dobMonth: json["dobMonth"],
        dobDay: json["dobDay"],
        tobHour: json["tobHour"],
        tobMin: json["tobMin"],
        meridiem: json["meridiem"],
      );

  Map<String, dynamic> toJson() => {
        "dobYear": dobYear,
        "dobMonth": dobMonth,
        "dobDay": dobDay,
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
