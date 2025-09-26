import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelalarm/constants/media_strings.dart';
import 'package:travelalarm/constants/text_strings.dart';
import 'package:video_player/video_player.dart';

import '../../route/app_route.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  ///Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  RxBool isReady =false.obs;

  List<VideoPlayerController> videoControllers = [];

  final pages = [
    {
      'video': AppMedia.onBoardingMedia1,
      'title': AppTexts.onBoardingText1,
      'description': AppTexts.onBoardingSubTitle1
    },
    {
      'video': AppMedia.onBoardingMedia2,
      'title': AppTexts.onBoardingText2,
      'description': AppTexts.onBoardingSubTitle2
    },
    {
      'video': AppMedia.onBoardingMedia3,
      'title': AppTexts.onBoardingText3,
      'description': AppTexts.onBoardingSubTitle3
    },
  ];

  @override
  void onInit() {
    super.onInit();
    initializeVideos();
  }

  Future<void> initializeVideos() async {
    for (var page in pages) {
      var controller = VideoPlayerController.asset(page['video']!);
      await controller.initialize();
      controller.setLooping(true);
      videoControllers.add(controller);
    }
    isReady.value = true;
    if (videoControllers.isNotEmpty) {
      videoControllers[0].play();
    }
  }



  void updatePageIndicator(index) {

    // Pause all videos except the current one
    for (int i = 0; i < videoControllers.length; i++) {
      if (i == index) {
        videoControllers[i].play();
      } else {
        videoControllers[i].pause();
      }
    }

    currentPageIndex.value = index;
  }

  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage(){
    if(currentPageIndex.value==2){
      Get.offAllNamed(Routes.location);
    }else{
      int page = currentPageIndex.value+1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage(){
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  @override
  void onClose() {
    // Dispose all video controllers
    for (var controller in videoControllers) {
      controller.dispose();
    }
    super.onClose();
  }

}