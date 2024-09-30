import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  ///Variable
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  ///Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;


  ///Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }


  ///Update Current Index and Jump to the next page
  void nextPage(){
  if (currentPageIndex.value == 2){
   // Get.to(LoginScreen());
  } else {
    int page = currentPageIndex.value + 1;
    pageController.jumpToPage(page);
  }
  }


  ///update Current Index and jump to the last page
  void skipPage(){
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

}