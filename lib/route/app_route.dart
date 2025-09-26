import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:travelalarm/features/location/location_screen.dart';
import 'package:travelalarm/features/onBoarding/onboarding_screen.dart';

class AppPages {
  static const initial = Routes.onBoarding;

  static final routes = [
    GetPage(
      name: Routes.onBoarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: Routes.location,
      page: () => const LocationScreen(),
    ),
  ];
}

class Routes {
  static const onBoarding = '/onBoarding';
  static const location = '/location';
  static const alarm = '/alarm';
}