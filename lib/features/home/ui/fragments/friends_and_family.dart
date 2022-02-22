import 'package:astro_tak/core/app_colors.dart';
import 'package:astro_tak/core/app_constants.dart';
import 'package:astro_tak/features/home/getxcontrollers/friends_and_family_get_controller.dart';
import 'package:astro_tak/widgets/alt_button.dart';
import 'package:astro_tak/widgets/standard_button.dart';
import 'package:astro_tak/widgets/standard_icon_button.dart';
import 'package:astro_tak/widgets/text_entry_field.dart';
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
          Obx(() {
            return !friendsAndFamilyGetController.newProfile.value
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
                                      onPressed: () {
                                        friendsAndFamilyGetController
                                            .newProfile.value = true;
                                      },
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
                : Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          leading: StandardIconButton(
                            icon: Icons.arrow_back_ios,
                            color: Colors.black,
                            onPressed: () {
                              friendsAndFamilyGetController.newProfile.value =
                                  false;
                            },
                          ),
                          title: Text('Add New Profile'),
                        ),
                        Expanded(
                          child: Form(
                            key: friendsAndFamilyGetController.formKey,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    //name, date, month, year, hour, minute, placeOfBirth
                                    TextEntryField(
                                      controller: friendsAndFamilyGetController
                                          .nameController,
                                      labelText: 'Name',
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter a name';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Obx(() {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Wrap(
                                              children: [
                                                TextEntryField(
                                                  controller:
                                                      friendsAndFamilyGetController
                                                          .dateController,
                                                  labelText: 'Date',
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please enter a date';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (value) {
                                                    friendsAndFamilyGetController
                                                        .dateFilledDigits
                                                        .value = value.length;
                                                  },
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "${friendsAndFamilyGetController.dateFilledDigits.value} / ${friendsAndFamilyGetController.dateDigits}",
                                                      style: TextStyle(
                                                          color: friendsAndFamilyGetController
                                                                      .dateFilledDigits
                                                                      .value <=
                                                                  friendsAndFamilyGetController
                                                                      .dateDigits
                                                              ? Colors.grey
                                                              : Colors.red,
                                                          fontWeight: friendsAndFamilyGetController
                                                                      .dateFilledDigits
                                                                      .value <=
                                                                  friendsAndFamilyGetController
                                                                      .dateDigits
                                                              ? FontWeight
                                                                  .normal
                                                              : FontWeight
                                                                  .bold),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.02,
                                          ),
                                          Expanded(
                                            child: Wrap(
                                              children: [
                                                TextEntryField(
                                                  controller:
                                                      friendsAndFamilyGetController
                                                          .monthController,
                                                  labelText: 'Month',
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please enter a month';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (value) {
                                                    friendsAndFamilyGetController
                                                        .monthFilledDigits
                                                        .value = value.length;
                                                  },
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "${friendsAndFamilyGetController.monthFilledDigits.value} / ${friendsAndFamilyGetController.monthDigits}",
                                                      style: TextStyle(
                                                          color: friendsAndFamilyGetController
                                                                      .monthFilledDigits
                                                                      .value <=
                                                                  friendsAndFamilyGetController
                                                                      .monthDigits
                                                              ? Colors.grey
                                                              : Colors.red,
                                                          fontWeight: friendsAndFamilyGetController
                                                                      .monthFilledDigits
                                                                      .value <=
                                                                  friendsAndFamilyGetController
                                                                      .monthDigits
                                                              ? FontWeight
                                                                  .normal
                                                              : FontWeight
                                                                  .bold),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.02,
                                          ),
                                          Expanded(
                                            child: Wrap(
                                              children: [
                                                TextEntryField(
                                                  controller:
                                                      friendsAndFamilyGetController
                                                          .yearController,
                                                  labelText: 'Year',
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please enter a year';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (value) {
                                                    friendsAndFamilyGetController
                                                        .yearFilledDigits
                                                        .value = value.length;
                                                  },
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "${friendsAndFamilyGetController.yearFilledDigits.value} / ${friendsAndFamilyGetController.yearDigits}",
                                                      style: TextStyle(
                                                          color: friendsAndFamilyGetController
                                                                      .yearFilledDigits
                                                                      .value <=
                                                                  friendsAndFamilyGetController
                                                                      .yearDigits
                                                              ? Colors.grey
                                                              : Colors.red,
                                                          fontWeight: friendsAndFamilyGetController
                                                                      .yearFilledDigits
                                                                      .value <=
                                                                  friendsAndFamilyGetController
                                                                      .yearDigits
                                                              ? FontWeight
                                                                  .normal
                                                              : FontWeight
                                                                  .bold),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Obx(() {
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: Wrap(
                                              children: [
                                                TextEntryField(
                                                  controller:
                                                      friendsAndFamilyGetController
                                                          .hourController,
                                                  labelText: 'Hour',
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please enter hour';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (value) {
                                                    friendsAndFamilyGetController
                                                        .hourFilledDigits
                                                        .value = value.length;
                                                  },
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "${friendsAndFamilyGetController.hourFilledDigits.value} / ${friendsAndFamilyGetController.hourDigits}",
                                                      style: TextStyle(
                                                          color: friendsAndFamilyGetController
                                                                      .hourFilledDigits
                                                                      .value <=
                                                                  friendsAndFamilyGetController
                                                                      .hourDigits
                                                              ? Colors.grey
                                                              : Colors.red,
                                                          fontWeight: friendsAndFamilyGetController
                                                                      .hourFilledDigits
                                                                      .value <=
                                                                  friendsAndFamilyGetController
                                                                      .hourDigits
                                                              ? FontWeight
                                                                  .normal
                                                              : FontWeight
                                                                  .bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Wrap(
                                              children: [
                                                TextEntryField(
                                                  controller:
                                                      friendsAndFamilyGetController
                                                          .minuteController,
                                                  labelText: 'Minute',
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return 'Please enter Minute';
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: (value) {
                                                    friendsAndFamilyGetController
                                                        .minuteFilledDigits
                                                        .value = value.length;
                                                  },
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "${friendsAndFamilyGetController.minuteFilledDigits.value} / ${friendsAndFamilyGetController.minuteDigits}",
                                                      style: TextStyle(
                                                          color: friendsAndFamilyGetController
                                                                      .minuteFilledDigits
                                                                      .value <=
                                                                  friendsAndFamilyGetController
                                                                      .minuteDigits
                                                              ? Colors.grey
                                                              : Colors.red,
                                                          fontWeight: friendsAndFamilyGetController
                                                                      .minuteFilledDigits
                                                                      .value <=
                                                                  friendsAndFamilyGetController
                                                                      .minuteDigits
                                                              ? FontWeight
                                                                  .normal
                                                              : FontWeight
                                                                  .bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    TextEntryField(
                                      controller: friendsAndFamilyGetController
                                          .placeOfBirthController,
                                      labelText: 'Place of Birth',
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter a place of birth';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),

                                    Row(
                                      children: [
                                        //genderList
                                        Expanded(
                                          child: Wrap(
                                            direction: Axis.vertical,
                                            children: [
                                              Text('Gender'),
                                              Container(
                                                width: Get.width * 0.45,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppConstants
                                                              .borderRadius),
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                ),
                                                child: DropdownButton<String>(
                                                    underline: Container(),
                                                    isExpanded: true,
                                                    value:
                                                        friendsAndFamilyGetController
                                                            .selectedGender
                                                            .value,
                                                    items:
                                                        friendsAndFamilyGetController
                                                            .genderList
                                                            .map((element) =>
                                                                DropdownMenuItem<
                                                                        String>(
                                                                    value:
                                                                        element,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child: Text(
                                                                          element),
                                                                    )))
                                                            .toList(),
                                                    onChanged: (value) {
                                                      friendsAndFamilyGetController
                                                          .selectedGender
                                                          .value = value!;
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.02,
                                        ),
                                        //relationList
                                        Expanded(
                                          child: Wrap(
                                            direction: Axis.vertical,
                                            children: [
                                              Text('Relation'),
                                              Container(
                                                width: Get.width * 0.45,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppConstants
                                                              .borderRadius),
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                ),
                                                child: DropdownButton<String>(
                                                    underline: Container(),
                                                    isExpanded: true,
                                                    value:
                                                        friendsAndFamilyGetController
                                                            .selectedRelation
                                                            .value,
                                                    items:
                                                        friendsAndFamilyGetController
                                                            .relationList
                                                            .map((element) =>
                                                                DropdownMenuItem<
                                                                        String>(
                                                                    value:
                                                                        element,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child: Text(
                                                                          element),
                                                                    )))
                                                            .toList(),
                                                    onChanged: (value) {
                                                      friendsAndFamilyGetController
                                                          .selectedRelation
                                                          .value = value!;
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 32.0),
                                      child: StandardButton(
                                          text: 'Save Changes',
                                          onPressed: () {}),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
