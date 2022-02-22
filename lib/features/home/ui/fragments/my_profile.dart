import 'package:astro_tak/core/app_colors.dart';
import 'package:astro_tak/features/home/getxcontrollers/home_page_get_controller.dart';
import 'package:astro_tak/features/home/ui/fragments/basic_profile.dart';
import 'package:astro_tak/features/home/ui/fragments/friends_and_family.dart';
import 'package:astro_tak/widgets/no_background_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageGetController homePageGetController =
        Get.find<HomePageGetController>();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() {
                  return NoBackgroundButton(
                    text: 'Basic Profile',
                    onPressed: () {
                      homePageGetController.basicProfileSelected.value =
                          !homePageGetController.basicProfileSelected.value;
                    },
                    backgroundColor:
                        homePageGetController.basicProfileSelected.value
                            ? AppColors.secondaryColor
                            : Colors.transparent,
                    textColor: homePageGetController.basicProfileSelected.value
                        ? Colors.white
                        : Colors.black,
                  );
                }),
                Obx(() {
                  return NoBackgroundButton(
                    text: 'Friends and Family Profile',
                    onPressed: () {
                      homePageGetController.basicProfileSelected.value =
                          !homePageGetController.basicProfileSelected.value;
                    },
                    backgroundColor:
                        !homePageGetController.basicProfileSelected.value
                            ? AppColors.secondaryColor
                            : Colors.transparent,
                    textColor: !homePageGetController.basicProfileSelected.value
                        ? Colors.white
                        : Colors.black,
                  );
                }),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return homePageGetController.basicProfileSelected.value
                  ? BasicProfile()
                  : FriendsAndFamily();
            }),
          ),
        ],
      ),
    );
  }
}
