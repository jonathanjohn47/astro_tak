import 'package:astro_tak/core/app_colors.dart';
import 'package:astro_tak/core/app_constants.dart';
import 'package:astro_tak/features/home/getxcontrollers/friends_and_family_get_controller.dart';
import 'package:astro_tak/widgets/alt_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AskQuestion extends StatelessWidget {
  const AskQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FriendsAndFamilyGetController friendsAndFamilyGetController =
    Get.put(FriendsAndFamilyGetController());

    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor.shade200,
                borderRadius:
                BorderRadius.circular(AppConstants.borderRadius),
              ),
              height: Get.height * 0.07,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    Icon(MdiIcons.wallet, color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Obx(() {
                    return Text(
                        'Wallet Balance: ₹${friendsAndFamilyGetController.walletBalance}',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: Get.height * 0.02,
                            fontWeight: FontWeight.w600));
                  }),
                  SizedBox(
                    width: Get.width * 0.1,
                  ),
                  AltButton(
                    text: 'Add Money',
                    onPressed: () {},
                    color: AppColors.primaryColor,
                    backGroundColor: Colors.white,
                  ),
                ],
              )),
        ),
      ],),
    );
  }
}
