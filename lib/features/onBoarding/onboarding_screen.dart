import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelalarm/constants/sizes.dart';
import 'package:travelalarm/helper/gradient_scaffold.dart';

import '../../common_widgets/onboarding_dot_navigation.dart';
import '../../common_widgets/onboarding_page.dart';
import '../../constants/text_strings.dart';
import '../../helper/device_utils.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final controller = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {

    return GradientScaffold(
      body: Obx((){
        if(controller.isReady.value==false){
          return Center(child: CircularProgressIndicator(),);
        }
        return Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children:  [
                OnBoardingPage(
                  controller: controller.videoControllers[0],
                  title: AppTexts.onBoardingText1,
                  subTitle: AppTexts.onBoardingSubTitle1,
                ),
                OnBoardingPage(
                  controller: controller.videoControllers[1],
                  title: AppTexts.onBoardingText2,
                  subTitle: AppTexts.onBoardingSubTitle2,
                ),
                OnBoardingPage(
                  controller: controller.videoControllers[2],
                  title: AppTexts.onBoardingText3,
                  subTitle: AppTexts.onBoardingSubTitle3,
                ),
              ],
            ),
            Positioned(
              top: DeviceUtils.getAppBarHeight(),
              right: AppSizes.defaultSpace,
              child: TextButton(
                onPressed: (OnBoardingController.instance.skipPage),
                child: Text(
                  AppTexts.skipButton,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),

            Positioned(
              bottom: DeviceUtils.getBottomNavigationBarHeight(),
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(AppSizes.defaultPadding, AppSizes.defaultPadding, AppSizes.defaultPadding, 0),
                child: Column(
                  children: [
                    OnBoardingDotNavigation(),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (OnBoardingController.instance.nextPage),
                        child: Text(
                          AppTexts.nextButton,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      })
    );
  }
}
