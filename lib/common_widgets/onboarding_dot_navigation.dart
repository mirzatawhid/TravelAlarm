import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../features/onBoarding/onboarding_controller.dart';
import '../helper/device_utils.dart';
class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return SmoothPageIndicator(
      controller: controller.pageController, // PageController
      onDotClicked: controller.dotNavigationClick,
      count:  3,
      effect: JumpingDotEffect(activeDotColor: AppColor.primary, dotColor: AppColor.primary.withOpacity(0.2),dotWidth: 8,dotHeight: 8)// your preferred effect
    );
  }
}