import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelalarm/constants/media_strings.dart';
import 'package:travelalarm/constants/text_strings.dart';
import 'package:travelalarm/features/location/location_controller.dart';
import 'package:travelalarm/helper/gradient_scaffold.dart';

import '../../constants/sizes.dart';
import '../../helper/device_utils.dart';
import '../../route/app_route.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});

  final controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Obx((){
        return Padding(
          padding: const EdgeInsets.all(AppSizes.defaultPadding),
          child: Column(
            children: [
              SizedBox(height: DeviceUtils.getAppBarHeight()),
              Text(
                AppTexts.locationTitle,
                style: Theme
                    .of(
                  context,
                )
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16),
              Text(
                AppTexts.locationSubTitle,
                style: Theme
                    .of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(
                  color: Colors.white,
                  height: 1.5,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: AppSizes.defaultPadding),
              CircleAvatar(
                radius: DeviceUtils.getScreenWidth(context) / 2,
                backgroundImage: AssetImage(AppMedia.locationMedia),
              ),
              Text(controller.currentAddress.value, textAlign: TextAlign.center,),
              SizedBox(height: 8,),
              OutlinedButton(
                onPressed: () {controller.fetchLocation();},
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppTexts.locationButton, style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall,),
                      SizedBox(width: 4,),
                      Icon(Icons.location_on_outlined, color: Colors.white,)
                    ]),
              ),
              SizedBox(height: AppSizes.defaultPadding,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if(controller.currentAddress.isNotEmpty){
                      Get.toNamed(Routes.alarm);
                    }
                  },
                  child: Text(
                    AppTexts.locationHomeButton,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall,
                  ),
                ),
              ),
            ],
          ),
        );
      })
    );
  }
}
