import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'Location_model.dart';

class LocationController extends GetxController {
  Rx<LocationModel?> currentLocation = Rx<LocationModel?>(null);
  Rx<String> currentAddress = ''.obs;
  RxBool isLoading = false.obs;
  RxString error = ''.obs;

  // Fetch coordinates
  Future<void> fetchLocation() async {
    try {
      isLoading.value = true;
      error.value = '';

      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Ask user to enable location
        bool opened = await Geolocator.openLocationSettings();
        if (!opened) {
          throw Exception('Please enable location services to continue.');
        }

        // Wait for user to turn it on
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          throw Exception('Location services are still disabled.');
        }
      }

      // Check permission
      PermissionStatus permission = await Permission.location.status;

      if (permission.isDenied) {
        permission = await Permission.location.request();
        if (permission.isDenied) {
          throw Exception('Location permission denied');
        }
      }

      if (permission.isPermanentlyDenied) {
        bool opened = await openAppSettings();
        if (!opened) {
          throw Exception('Location permission permanently denied. Enable it in settings.');
        }
        permission = await Permission.location.status;
        if (!permission.isGranted) {
          throw Exception('Location permission not granted after opening settings.');
        }
      }

      // Get current coordinates
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      currentLocation.value = LocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      // Convert coordinates to address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        currentAddress.value =
        '${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
      } else {
        currentAddress.value = "Address not found";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
