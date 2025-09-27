import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travelalarm/constants/sizes.dart';
import 'package:travelalarm/features/alarm/alarm_controller.dart';
import 'package:travelalarm/features/location/location_controller.dart';
import 'package:travelalarm/helper/gradient_scaffold.dart';
import '../../constants/colors.dart';
import '../../constants/text_strings.dart';
import '../../helper/device_utils.dart';

class AlarmScreen extends StatelessWidget {
  AlarmScreen({super.key});

  final controller = Get.put(AlarmController());
  final locationController = LocationController.instance;

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: DeviceUtils.getAppBarHeight()),
            Text(
              AppTexts.alarmTitle,
              style: Theme
                  .of(
                context,
              )
                  .textTheme
                  .titleLarge,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(vertical: AppSizes.defaultPadding),
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(89)
              ),
              child: Row(
                children: [
                  SizedBox(width: 8,),
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 4,),
                  Text(locationController.currentCity.value, style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall?.copyWith(color: Colors.white.withOpacity(0.27)),)
                ],
              ),
            ),
            SizedBox(height: 16,),
            Text(
              AppTexts.alarmSubTitle,
              style: Theme
                  .of(
                context,
              )
                  .textTheme
                  .titleMedium,
              textAlign: TextAlign.start,
            ),
            Obx(() {
              if (controller.alarms.isEmpty) {
                return const CircularProgressIndicator(color: AppColor.primary,);
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.alarms.length,
                  itemBuilder: (context, index) {
                    final alarm = controller.alarms[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      padding: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                          color: AppColor.secondary,
                          borderRadius: BorderRadius.circular(89)
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(DateFormat('h:mm a').format(alarm.time),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleSmall,),
                            Text(DateFormat('EEE d MMM y').format(alarm.time),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,),
                          ],
                        ),
                        trailing: Switch(value: alarm.isActive,
                          onChanged: (_) => controller.toggleAlarm(alarm),
                          activeTrackColor: AppColor.primary,
                        activeThumbColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                        inactiveThumbColor: Colors.black,),
                        onLongPress: () => controller.deleteAlarm(alarm),
                      ),
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: DeviceUtils.getBottomNavigationBarHeight()),
        child: FloatingActionButton(
          backgroundColor: AppColor.primary,
          shape: CircleBorder(),
          child: const Icon(Icons.add),
          onPressed: () async {
            // Pick a date first
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
            );

            if (pickedDate == null) return; // User canceled

            // Pick a time
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (pickedTime == null) return; // User canceled

            // Combine date and time
            final alarmDateTime = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );

            // Add alarm
            controller.addAlarm(alarmDateTime);
          },
        ),
      ),
    );
  }
}