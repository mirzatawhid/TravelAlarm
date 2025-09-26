import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:travelalarm/features/alarm/alarm_screen.dart';
import 'package:travelalarm/features/location/location_screen.dart';
import 'package:travelalarm/features/onBoarding/onboarding_screen.dart';

class AppPages {
  static const initial = Routes.onBoarding;

  static final routes = [
    GetPage(
      name: Routes.onBoarding,
      page: () =>  OnboardingScreen(),
    ),
    GetPage(
      name: Routes.location,
      page: () => LocationScreen(),
    ),
    GetPage(
      name: Routes.alarm,
      page: () => AlarmScreen(),
    ),
  ];
}

class Routes {
  static const onBoarding = '/onBoarding';
  static const location = '/location';
  static const alarm = '/alarm';
}