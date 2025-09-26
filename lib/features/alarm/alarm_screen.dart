import 'package:flutter/material.dart';
import 'package:travelalarm/helper/gradient_scaffold.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientScaffold(
      body: Text("alarm"),
    );
  }
}
