import 'dart:convert';

import 'package:astro_tak/features/home/model/all_relatives.dart';
import 'package:astro_tak/features/home/model/location_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FriendsAndFamilyGetController extends GetxController {
  RxBool newProfile = false.obs;
  RxDouble walletBalance = 0.0.obs;

  RxList<AllRelative> friendsAndFamilyListItems = <AllRelative>[].obs;
  int editingIndex = -1;

  //formkey
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //name, date, month, year, hour, minute, placeOfBirth
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();

  int dateDigits = 2;
  int monthDigits = 2;
  int yearDigits = 4;
  int hourDigits = 2;
  int minuteDigits = 2;

  RxInt dateFilledDigits = 0.obs;
  RxInt monthFilledDigits = 0.obs;
  RxInt yearFilledDigits = 0.obs;
  RxInt hourFilledDigits = 0.obs;
  RxInt minuteFilledDigits = 0.obs;

  RxString meridian = "AM".obs;

  RxList genderList = <String>['OTHERS', 'FEMALE', 'MALE'].obs;
  RxString selectedGender = 'OTHERS'.obs;

  RxList<String> relationList = <String>[
    'Mother',
    'Father',
    'Brother',
    'Sister',
    'Uncle',
    'Father In Law',
    'Mother In Law',
    'Spouse',
  ].obs;
  RxString selectedRelation = 'Mother'.obs;

  RxBool showLoader = false.obs;

  Future<void> getRelatives() async {
    showLoader.value = true;
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ'
    };
    var request = http.Request(
        'GET', Uri.parse('https://staging-api.astrotak.com/api/relative/all'));
    request.body = '''''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print('Get Relatives Response: ${response}');
    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      AllRelatives allRelatives =
          AllRelatives.fromJson(json.decode(responseBody));
      for (var element in allRelatives.data.allRelatives) {}
      friendsAndFamilyListItems.value = allRelatives.data.allRelatives;

      for (var relative in allRelatives.data.allRelatives) {
        if (relationList.indexWhere((relation) =>
                relation.toLowerCase() == relative.relation.toLowerCase()) ==
            -1) {
          relationList.add(relative.relation);
        }
      }
      List<String> emptyList = [];
      for (var element in relationList) {
        if (!emptyList.contains(element)) {
          emptyList.add(element);
        }
      }
      relationList.value = emptyList;

      selectedRelation.value = relationList.value[0];
    } else {
      throw Exception('Failed to get relatives');
    }
    showLoader.value = false;
  }

  Future<void> saveRelative(AllRelative relative) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('https://staging-api.astrotak.com/api/relative'));

    request.body = jsonEncode(relative);
    print('Save Relative Request: ${request.body}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('Save Relative Response: ${response}');
    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to save relative');
    }
  }

  Future<void> deleteRelative(AllRelative relative) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging-api.astrotak.com/api/relative/delete/${relative.uuid}'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('Delete Relative Response: ${response}');
    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to delete relative');
    }
  }

  Future<void> editRelative(AllRelative relative) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging-api.astrotak.com/api/relative/update/${relative.uuid}'));
    request.body = json.encode(relative);
    print('Edit Relative request body: ${request.body}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('Edit Relative response: ${response}');
    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to edit relative');
    }
  }

  Future<String> getLocation(String place) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://staging-api.astrotak.com/api/location/place?inputPlace=${place.camelCase}'));
    request.body = json.encode({"inputPlace": place.camelCase});
    print('Get Location request body: ${request.body}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('Get Location response: ${response}');

    String locationId = '';
    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();

      LocationResponse locationResponse =
          LocationResponse.fromJson(jsonDecode(responseString));
      locationId = locationResponse.data[0].placeId;
    } else {
      throw Exception('Failed to get location');
    }
    return locationId;
  }

  @override
  void onInit() {
    getRelatives();
    super.onInit();
  }
}
