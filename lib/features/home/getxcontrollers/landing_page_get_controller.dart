import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPageGetController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  RxInt currentTabIndex = 0.obs;
  RxList<String> landingPageDrawerItems = <String>['Friends and Family'].obs;
  RxList<String> landingPageTabItems =
      <String>['Home', 'Talk', 'Ask Question', 'Reports', 'Chat'].obs;

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this)
      ..addListener(() {
        currentTabIndex.value = tabController.index;
        print('Tab Controller Index: ${tabController.index}');
        print('Current Tab Index: ${currentTabIndex.value}');
      });
    super.onInit();
  }
}
