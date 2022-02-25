import 'package:astro_tak/core/app_colors.dart';
import 'package:astro_tak/features/home/getxcontrollers/friends_and_family_get_controller.dart';
import 'package:astro_tak/features/home/getxcontrollers/landing_page_get_controller.dart';
import 'package:astro_tak/widgets/alt_button.dart';
import 'package:astro_tak/widgets/text_entry_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AskQuestion extends StatelessWidget {
  const AskQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FriendsAndFamilyGetController friendsAndFamilyGetController =
        Get.put(FriendsAndFamilyGetController());
    LandingPageGetController landingPageGetController =
        Get.find<LandingPageGetController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: AppColors.primaryColor,
                height: Get.height * 0.07,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(MdiIcons.wallet, color: Colors.white),
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Obx(() {
                      return Text(
                          'Wallet Balance: ₹${friendsAndFamilyGetController.walletBalance}',
                          style: TextStyle(
                              color: Colors.white,
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Ask A Question',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  SizedBox(
                    height: Get.height * 0.18,
                    child: SingleChildScrollView(
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Ask a Question Seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self, life, business, money, education or work, our astrologers will do an in depth study of your birth chart to provide personalized responses along with remedies.',
                            maxLines: 15,
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text('Choose Category',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Obx(() {
                    return DropdownButton<String>(
                        isExpanded: true,
                        value: landingPageGetController
                            .selectedQuestionCategory.value,
                        items: landingPageGetController.questionCategories
                            .map((element) => DropdownMenuItem<String>(
                                value: element,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(element),
                                )))
                            .toList(),
                        onChanged: (value) {
                          landingPageGetController
                              .selectedQuestionCategory.value = value!;
                        });
                  }),
                  SizedBox(
                    height: Get.height * 0.2,
                    child: TextEntryField(
                      labelText: 'Type a question here...',
                      controller: landingPageGetController.questionController,
                      maxLength: 15,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text('Ideas to ask (Select Any)',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  SizedBox(
                    height: Get.height * 0.3,
                    child: Obx(() {
                      return ListView.builder(
                          itemCount: landingPageGetController
                              .suggestedQuestions.length,
                          itemBuilder: (context, index) {
                            return Wrap(
                              children: [
                                Obx(() {
                                  return ListTile(
                                    leading: Icon(
                                      MdiIcons.headQuestion,
                                      color: AppColors.secondaryColor,
                                    ),
                                    title: Text(landingPageGetController
                                        .suggestedQuestions[index]),
                                    onTap: () {
                                      landingPageGetController
                                              .questionController.text =
                                          landingPageGetController
                                              .suggestedQuestions[index];
                                    },
                                  );
                                }),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Divider(
                                    color: Colors.black,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            );
                          });
                    }),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you. ',
                          maxLines: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Container(
                    color: AppColors.secondaryColor.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '• Personalized responses provided by our team of Vedic astrologers within 24 hours. \n\n• Qualified and experienced astrologers will look into your birth chart and provide the right guidance. \n\n• You can seek answers to any part of your life and for most pressing issues. \n\n• Our team of Vedic astrologers will not just p 0 answers but also suggest a remedial solution.',
                              maxLines: 20,
                              style: TextStyle(
                                  color: AppColors.secondaryColor.shade700,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
