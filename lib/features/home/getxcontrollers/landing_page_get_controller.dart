import 'dart:convert';

import 'package:astro_tak/features/home/model/queston_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LandingPageGetController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  RxInt currentTabIndex = 0.obs;
  RxList<String> landingPageDrawerItems = <String>['Friends and Family'].obs;
  RxList<String> landingPageTabItems =
      <String>['Home', 'Talk', 'Ask Question', 'Reports', 'Chat'].obs;
  RxList<String> questionCategories = <String>[].obs;
  RxString selectedQuestionCategory = 'All'.obs;

  TextEditingController questionController = TextEditingController();

  RxDouble questionCost = 0.0.obs;

  QuestionCategoriesApiResponseModel questionCategoriesApiResponseModel =
      QuestionCategoriesApiResponseModel.empty();

  RxList<String> suggestedQuestions = <String>[].obs;

  Future<void> fetchQuestionCategories() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://staging-api.astrotak.com/api/question/category/all'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      questionCategoriesApiResponseModel =
          QuestionCategoriesApiResponseModel.fromJson(
              json.decode(await response.stream.bytesToString()));
      questionCategories.value =
          questionCategoriesApiResponseModel.data.map((e) => e.name).toList();
      selectedQuestionCategory.value =
          questionCategoriesApiResponseModel.data[0].name;
      suggestedQuestions.value =
          questionCategoriesApiResponseModel.data[0].suggestions;
      questionCost.value = questionCategoriesApiResponseModel.data[0].price;
      int questionCategoryIndex = 0;
      for (int i = 0; i < questionCategoriesApiResponseModel.data.length; i++) {
        if (questionCategoriesApiResponseModel.data[i].name ==
            selectedQuestionCategory.value) {
          questionCategoryIndex = i;
          break;
        }
      }
      questionCost.value =
          questionCategoriesApiResponseModel.data[questionCategoryIndex].price;
    } else {
      throw Exception('Failed to load question categories');
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this)
      ..addListener(() {
        currentTabIndex.value = tabController.index;
      });
    tabController.index = 2;
    currentTabIndex.value = 2;
    fetchQuestionCategories();
    super.onInit();
  }

  void onSelectedCategoryChanged(String? value) {
    if (value != null) {
      int questionCategoryIndex = 0;
      for (int i = 0; i < questionCategories.value.length; i++) {
        if (questionCategories.value[i] == value) {
          questionCategoryIndex = i;
          break;
        }
      }
      questionCost.value =
          questionCategoriesApiResponseModel.data[questionCategoryIndex].price;
      selectedQuestionCategory.value = value;
      suggestedQuestions.value = questionCategoriesApiResponseModel
          .data[questionCategoryIndex].suggestions;
    }
  }
}
