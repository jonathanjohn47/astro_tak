import 'package:astro_tak/features/home/model/friends_and_family_model.dart';
import 'package:astro_tak/widgets/standard_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendsAndFamilyGetController extends GetxController {
  RxBool newProfile = false.obs;
  RxDouble walletBalance = 0.0.obs;

  RxList<Widget> friendsAndFamilyListItems = <Widget>[].obs;

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
