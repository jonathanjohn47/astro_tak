import 'package:astro_tak/core/app_colors.dart';
import 'package:astro_tak/core/app_constants.dart';
import 'package:astro_tak/features/home/getxcontrollers/friends_and_family_get_controller.dart';
import 'package:astro_tak/widgets/alt_button.dart';
import 'package:astro_tak/widgets/standard_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FriendsAndFamily extends StatelessWidget {
  const FriendsAndFamily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FriendsAndFamilyGetController friendsAndFamilyGetController =
        Get.put(FriendsAndFamilyGetController());
    return Scaffold(
      body: Column(
        children: [
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
          !friendsAndFamilyGetController.newProfile.value
              ? Expanded(
                  child: Obx(() {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          itemCount: friendsAndFamilyGetController
                                  .friendsAndFamilyListItems.length +
                              2,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    //name, DOB, TOB, Relation
                                    Text('Name',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.primaryColor)),
                                    SizedBox(
                                      width: Get.width * 0.1,
                                    ),
                                    Text('DOB',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.primaryColor)),
                                    SizedBox(
                                      width: Get.width * 0.1,
                                    ),
                                    Text('TOB',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.primaryColor)),
                                    SizedBox(
                                      width: Get.width * 0.1,
                                    ),
                                    Text('Relation',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.primaryColor)),
                                  ],
                                ),
                              );
                            } else if (index ==
                                friendsAndFamilyGetController
                                        .friendsAndFamilyListItems.length +
                                    1) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StandardButton(
                                    text: 'Add New Profile',
                                    onPressed: () {},
                                    icon: MdiIcons.plus,
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          }),
                    );
                  }),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [],
                  ),
                ),
        ],
      ),
    );
  }
}
