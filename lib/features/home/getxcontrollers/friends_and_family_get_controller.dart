import 'package:astro_tak/features/home/model/friends_and_family_model.dart';
import 'package:astro_tak/widgets/standard_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendsAndFamilyGetController extends GetxController {
  RxBool newProfile = false.obs;
  RxDouble walletBalance = 0.0.obs;

  RxList<Widget> friendsAndFamilyListItems = <Widget>[].obs;

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

  Widget getFriendsAndFamilyListItem(FriendsAndFamilyModel fandf) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Text(fandf.name),
          SizedBox(
            width: Get.width * 0.1,
          ),
          Text(fandf.dateOfBirth),
          SizedBox(
            width: Get.width * 0.1,
          ),
          Text(fandf.placeOfBirth),
          SizedBox(
            width: Get.width * 0.1,
          ),
          Text(fandf.relation),
          SizedBox(
            width: Get.width * 0.1,
          ),
          StandardIconButton(icon: Icons.edit, onPressed: () {}),
          SizedBox(
            width: Get.width * 0.1,
          ),
          StandardIconButton(icon: Icons.delete, onPressed: () {}),
        ]),
      ),
    );
  }
}
