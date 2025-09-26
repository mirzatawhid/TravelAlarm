import 'package:flutter/material.dart';
import 'package:travelalarm/common_widgets/onboarding_media_player.dart';
import 'package:travelalarm/helper/device_utils.dart';
import '../constants/sizes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.media,
    required this.title,
    required this.subTitle,
  });

  final String media, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 🔹 Video takes half of the screen height
        SizedBox(
          height: DeviceUtils.getScreenHeight() * 0.5,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(AppSizes.mediaRadius),
              bottomRight: Radius.circular(AppSizes.mediaRadius),
            ),
            child: OnboardingMediaPlayer(videoPath: media),
          ),
        ),

        const SizedBox(height: 24),

        // 🔹 Text only takes the space it needs
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(height: 1.5),
              ),
              const SizedBox(height: 16),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}