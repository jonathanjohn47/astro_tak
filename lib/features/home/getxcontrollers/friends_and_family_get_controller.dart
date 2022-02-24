import 'package:astro_tak/features/home/model/friends_and_family_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendsAndFamilyGetController extends GetxController {
  RxBool newProfile = false.obs;
  RxDouble walletBalance = 0.0.obs;

  RxList<FriendsAndFamilyModel> friendsAndFamilyListItems =
      <FriendsAndFamilyModel>[].obs;
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

  RxList genderList = <String>['Male', 'Female'].obs;
  RxString selectedGender = 'Male'.obs;

  RxList relationList = <String>['Mother', 'Father', 'Brother'].obs;
  RxString selectedRelation = 'Mother'.obs;
}
