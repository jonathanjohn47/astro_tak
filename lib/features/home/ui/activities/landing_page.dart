import 'package:astro_tak/core/app_colors.dart';
import 'package:astro_tak/features/home/getxcontrollers/landing_page_get_controller.dart';
import 'package:astro_tak/features/home/ui/activities/landing_page_drawer.dart';
import 'package:astro_tak/features/home/ui/activities/my_profile_page.dart';
import 'package:astro_tak/features/home/ui/fragments/ask_question.dart';
import 'package:astro_tak/widgets/standard_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LandingPageGetController landingPageGetController =
        Get.put(LandingPageGetController());
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 12),
          child: StandardAppBar(
            trailing: InkWell(
              onTap: () {
                Get.to(HomePage());
              },
              child: SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('assets/images/profile.png')),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: SizedBox(
                      width: 32,
                      height: 32,
                      child: Image.asset('assets/images/hamburger.png')),
                );
              },
            ),
          ),
        ),
        body: TabBarView(
          controller: landingPageGetController.tabController,
          children: [
            //home, talk, ask question, reports, chat
            Center(child: Text('Home')),
            Center(child: Text('Talk')),
            AskQuestion(),
            Center(child: Text('Reports')),
            Center(child: Text('Chat')),
          ],
        ),
        bottomNavigationBar: TabBar(
          controller: landingPageGetController.tabController,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              icon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Obx(() {
                  return Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/home.png',
                                color: landingPageGetController
                                            .currentTabIndex.value ==
                                        0
                                    ? AppColors.secondaryColor
                                    : Colors.grey,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                                color: landingPageGetController
                                            .currentTabIndex.value ==
                                        0
                                    ? AppColors.secondaryColor
                                    : Colors.grey,
                                fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  );
                }),
              ),
            ),
            Tab(
              icon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Obx(() {
                  return Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/talk.png',
                                color: landingPageGetController
                                            .currentTabIndex.value ==
                                        1
                                    ? AppColors.secondaryColor
                                    : Colors.grey.shade700,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Talk',
                            style: TextStyle(
                                color: landingPageGetController
                                            .currentTabIndex.value ==
                                        1
                                    ? AppColors.secondaryColor
                                    : Colors.grey,
                                fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  );
                }),
              ),
            ),
            Tab(
              icon: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Obx(() {
                  return Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/ask.png',
                                color: landingPageGetController
                                            .currentTabIndex.value ==
                                        2
                                    ? AppColors.secondaryColor
                                    : Colors.grey.shade700,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            landingPageGetController.landingPageTabItems[2],
                            style: TextStyle(
                                color: landingPageGetController
                                            .currentTabIndex.value ==
                                        2
                                    ? AppColors.secondaryColor
                                    : Colors.grey,
                                fontSize: 8),
                          ),
                        ],
                      )
                    ],
                  );
                }),
              ),
            ),
            Tab(
              icon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Obx(() {
                  return Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/reports.png',
                                color: landingPageGetController
                                            .currentTabIndex.value ==
                                        3
                                    ? AppColors.secondaryColor
                                    : Colors.grey.shade700,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            landingPageGetController.landingPageTabItems[3],
                            style: TextStyle(
                                color: landingPageGetController
                                            .currentTabIndex.value ==
                                        3
                                    ? AppColors.secondaryColor
                                    : Colors.grey,
                                fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  );
                }),
              ),
            ),
            Tab(
              icon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Obx(() {
                  return Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 26,
                              height: 26,
                              child: Image.asset(
                                'assets/images/chat.png',
                                color: landingPageGetController
                                            .currentTabIndex.value ==
                                        4
                                    ? AppColors.secondaryColor
                                    : Colors.grey,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            landingPageGetController.landingPageTabItems[4],
                            style: TextStyle(
                                color: landingPageGetController
                                            .currentTabIndex.value ==
                                        4
                                    ? AppColors.secondaryColor
                                    : Colors.grey,
                                fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
        drawer: LandingPageDrawer(),
      ),
    );
  }
}
