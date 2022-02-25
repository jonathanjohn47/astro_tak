import 'dart:convert';

import 'package:astro_tak/features/home/model/all_relatives.dart';
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

  RxList genderList = <String>['OTHERS', 'FEMALE', 'MALE'].obs;
  RxString selectedGender = 'OTHERS'.obs;

  RxList relationList = <String>[
    'Mother',
    'Father',
    'Brother',
    'Sister',
    'Uncle',
    'Father In Law',
    'Mother In Law'
  ].obs;
  RxString selectedRelation = 'Mother'.obs;

  Future<void> getRelatives() async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ'
    };
    var request = http.Request(
        'GET', Uri.parse('https://staging-api.astrotak.com/api/relative/all'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      AllRelatives allRelatives =
          AllRelatives.fromJson(json.decode(responseBody));
      friendsAndFamilyListItems.value = allRelatives.data.allRelatives;
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> saveRelatives(AllRelative relative) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST', Uri.parse('https://staging-api.astrotak.com/api/relative'));
    print(jsonEncode(relative));
    request.body = jsonEncode(relative);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('success');
    } else {
      print(response.reasonPhrase);
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
    print(jsonEncode(relative));

    if (response.statusCode == 200) {
      print('success');
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void onInit() {
    print('FriendsAndFamilyGetController onInit');
    getRelatives();
    super.onInit();
  }
}
