import 'package:astro_tak/core/app_colors.dart';
import 'package:astro_tak/core/app_constants.dart';
import 'package:astro_tak/dialogs/delete_confirmation_dialog.dart';
import 'package:astro_tak/features/home/getxcontrollers/friends_and_family_get_controller.dart';
import 'package:astro_tak/features/home/model/all_relatives.dart';
import 'package:astro_tak/helpers/date_time_helper.dart';
import 'package:astro_tak/misc.dart';

//C:\Users\jonat\StudioProjects\astro_tak\lib\widgets\alt_button.dart
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
        Get.find<FriendsAndFamilyGetController>();
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                      Spacer(),
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
                                AllRelative fandf =
                                    friendsAndFamilyGetController
                                        .friendsAndFamilyListItems[index - 1];
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: SizedBox(
                                        width: Get.width - 32,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(fandf.fullName),
                                              /*SizedBox(
                                                width: Get.width * 0.02,
                                              ),*/
                                              Text(fandf.dateAndTimeOfBirth
                                                  .getDateString()),
                                              /*SizedBox(
                                                width: Get.width * 0.02,
                                              ),*/
                                              Text(
                                                  "${fandf.dateAndTimeOfBirth.getTwelveHourTime()}"),
                                              /*SizedBox(
                                                width: Get.width * 0.02,
                                              ),*/
                                              Text(fandf.relation),
                                              /*SizedBox(
                                                width: Get.width * 0.03,
                                              ),*/
                                              Row(
                                                children: [
                                                  StandardIconButton(
                                                      icon: Icons.edit,
                                                      onPressed: () {
                                                        friendsAndFamilyGetController
                                                                .editingIndex =
                                                            index - 1;
                                                        friendsAndFamilyGetController
                                                            .newProfile
                                                            .value = true;
                                                        friendsAndFamilyGetController
                                                                .nameController
                                                                .text =
                                                            fandf.fullName;
                                                        friendsAndFamilyGetController
                                                                .dateController
                                                                .text =
                                                            fandf
                                                                .dateAndTimeOfBirth
                                                                .dateTimeToString()
                                                                .getDay()
                                                                .toString();
                                                        friendsAndFamilyGetController
                                                                .monthController
                                                                .text =
                                                            fandf
                                                                .dateAndTimeOfBirth
                                                                .dateTimeToString()
                                                                .getMonth()
                                                                .toString();
                                                        friendsAndFamilyGetController
                                                                .yearController
                                                                .text =
                                                            fandf
                                                                .dateAndTimeOfBirth
                                                                .dateTimeToString()
                                                                .getYear()
                                                                .toString();
                                                        friendsAndFamilyGetController
                                                                .hourController
                                                                .text =
                                                            fandf
                                                                .dateAndTimeOfBirth
                                                                .dateTimeToString()
                                                                .getHour()
                                                                .toString();
                                                        friendsAndFamilyGetController
                                                                .minuteController
                                                                .text =
                                                            fandf
                                                                .dateAndTimeOfBirth
                                                                .dateTimeToString()
                                                                .getMinute()
                                                                .toString();
                                                        friendsAndFamilyGetController
                                                                .placeOfBirthController
                                                                .text =
                                                            fandf.birthPlace
                                                                .placeName;
                                                        friendsAndFamilyGetController
                                                                .selectedRelation
                                                                .value =
                                                            fandf.relation;
                                                        friendsAndFamilyGetController
                                                                .selectedGender
                                                                .value =
                                                            fandf.gender;
                                                      }),
                                                  StandardIconButton(
                                                      icon: Icons.delete,
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return DeleteConfirmationDialog(
                                                                  onDelete: () {
                                                                    friendsAndFamilyGetController
                                                                        .deleteRelative(
                                                                            fandf)
                                                                        .then((value) =>
                                                                            friendsAndFamilyGetController.getRelatives());
                                                                  },
                                                                  onCancel:
                                                                      () {});
                                                            });
                                                      }),
                                                ],
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                );
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
                              friendsAndFamilyGetController.editingIndex = -1;

                              friendsAndFamilyGetController.nameController
                                  .clear();
                              friendsAndFamilyGetController.dateController
                                  .clear();
                              friendsAndFamilyGetController.monthController
                                  .clear();
                              friendsAndFamilyGetController.yearController
                                  .clear();
                              friendsAndFamilyGetController.hourController
                                  .clear();
                              friendsAndFamilyGetController.minuteController
                                  .clear();
                              friendsAndFamilyGetController
                                  .placeOfBirthController
                                  .clear();
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
                                    Wrap(
                                      children: [
                                        Text('Birth Details'),
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
                                      ],
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
                                            width: Get.width * 0.02,
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
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Wrap(
                                            children: [
                                              Row(
                                                children: [
                                                  StandardButton(
                                                    elevation: 1,
                                                    text: 'AM',
                                                    onPressed: () {
                                                      friendsAndFamilyGetController
                                                          .meridian
                                                          .value = 'AM';
                                                    },
                                                    color:
                                                        friendsAndFamilyGetController
                                                                    .meridian
                                                                    .value ==
                                                                'AM'
                                                            ? AppColors
                                                                .primaryColor
                                                            : Colors.white,
                                                    textColor:
                                                        friendsAndFamilyGetController
                                                                    .meridian
                                                                    .value ==
                                                                'AM'
                                                            ? Colors.white
                                                            : AppColors
                                                                .primaryColor,
                                                  ),
                                                  StandardButton(
                                                    elevation: 1,
                                                    text: 'PM',
                                                    onPressed: () {
                                                      friendsAndFamilyGetController
                                                          .meridian
                                                          .value = 'PM';
                                                    },
                                                    color:
                                                        friendsAndFamilyGetController
                                                                    .meridian
                                                                    .value ==
                                                                'PM'
                                                            ? AppColors
                                                                .primaryColor
                                                            : Colors.white,
                                                    textColor:
                                                        friendsAndFamilyGetController
                                                                    .meridian
                                                                    .value ==
                                                                'PM'
                                                            ? Colors.white
                                                            : AppColors
                                                                .primaryColor,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          )
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
                                          onPressed: () {
                                            if (friendsAndFamilyGetController
                                                .formKey.currentState!
                                                .validate()) {
                                              friendsAndFamilyGetController
                                                  .getLocation(
                                                      friendsAndFamilyGetController
                                                          .placeOfBirthController
                                                          .text)
                                                  .then((value) {
                                                AllRelative friendsAndFamilyModel =
                                                    AllRelative(
                                                        uuid: friendsAndFamilyGetController.editingIndex == -1
                                                            ? Misc.getUniqueId()
                                                            : friendsAndFamilyGetController
                                                                .friendsAndFamilyListItems[friendsAndFamilyGetController
                                                                    .editingIndex]
                                                                .uuid,
                                                        relation: friendsAndFamilyGetController
                                                            .selectedRelation
                                                            .value,
                                                        relationId: friendsAndFamilyGetController.relationList.indexOf(friendsAndFamilyGetController.selectedRelation.value) +
                                                            1,
                                                        firstName: friendsAndFamilyGetController
                                                            .nameController.text
                                                            .split(' ')[0],
                                                        middleName: friendsAndFamilyGetController.nameController.text.split(' ').length > 2
                                                            ? friendsAndFamilyGetController
                                                                .nameController
                                                                .text
                                                                .split(' ')[1]
                                                            : '',
                                                        lastName: friendsAndFamilyGetController.nameController.text.split(' ').length == 1
                                                            ? ''
                                                            : friendsAndFamilyGetController
                                                                .nameController
                                                                .text
                                                                .split(' ')
                                                                .last,
                                                        fullName: friendsAndFamilyGetController.nameController.text,
                                                        gender: friendsAndFamilyGetController.selectedGender.value,
                                                        dateAndTimeOfBirth: DateTime(int.parse(friendsAndFamilyGetController.yearController.text), int.parse(friendsAndFamilyGetController.monthController.text), int.parse(friendsAndFamilyGetController.dateController.text), int.parse(friendsAndFamilyGetController.hourController.text), int.parse(friendsAndFamilyGetController.minuteController.text)),
                                                        birthDetails: BirthDetails(
                                                          dobYear: int.parse(
                                                              friendsAndFamilyGetController
                                                                  .yearController
                                                                  .text),
                                                          dobMonth: int.parse(
                                                              friendsAndFamilyGetController
                                                                  .monthController
                                                                  .text),
                                                          dobDay: int.parse(
                                                              friendsAndFamilyGetController
                                                                  .dateController
                                                                  .text),
                                                          tobHour: int.parse(
                                                              friendsAndFamilyGetController
                                                                  .hourController
                                                                  .text),
                                                          tobMin: int.parse(
                                                              friendsAndFamilyGetController
                                                                  .minuteController
                                                                  .text),
                                                          meridiem:
                                                              friendsAndFamilyGetController
                                                                  .meridian
                                                                  .value,
                                                        ),
                                                        birthPlace: BirthPlace(
                                                          placeId: value,
                                                          placeName:
                                                              friendsAndFamilyGetController
                                                                  .placeOfBirthController
                                                                  .text,
                                                        ));
                                                if (friendsAndFamilyGetController
                                                        .editingIndex ==
                                                    -1) {
                                                  friendsAndFamilyGetController
                                                      .friendsAndFamilyListItems
                                                      .add(
                                                          friendsAndFamilyModel);
                                                  friendsAndFamilyGetController
                                                      .saveRelative(
                                                          friendsAndFamilyModel)
                                                      .then((value) {
                                                    friendsAndFamilyGetController
                                                        .getRelatives();
                                                  });
                                                } else {
                                                  friendsAndFamilyGetController
                                                      .editRelative(
                                                          friendsAndFamilyModel)
                                                      .then((value) =>
                                                          friendsAndFamilyGetController
                                                              .getRelatives());
                                                }
                                                friendsAndFamilyGetController
                                                    .newProfile.value = false;
                                                friendsAndFamilyGetController
                                                    .editingIndex = -1;
                                              });
                                            }
                                          }),
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
