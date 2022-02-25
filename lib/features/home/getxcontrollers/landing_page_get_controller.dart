import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPageGetController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  RxInt currentTabIndex = 0.obs;
  RxList<String> landingPageDrawerItems = <String>['Friends and Family'].obs;
  RxList<String> landingPageTabItems =
      <String>['Home', 'Talk', 'Ask Question', 'Reports', 'Chat'].obs;
  RxList<String> questionCategories =
      <String>['All', 'Love', 'General', 'Life'].obs;
  RxString selectedQuestionCategory = 'All'.obs;

  TextEditingController questionController = TextEditingController();

  RxList<String> suggestedQuestions = <String>[
    'When is the right time for me to introduce my boyfriend/girlfriend?',
    'Doubtful about taking my relationship to the next level?',
    'How do I know if my partner is really the one?',
    'How can I tell if my relationship is moving too fast?',
    'How can I make sure my relationship lasts?'
  ].obs;

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this)
      ..addListener(() {
        currentTabIndex.value = tabController.index;
      });
    tabController.index = 2;
    currentTabIndex.value = 2;
    super.onInit();
  }
}
