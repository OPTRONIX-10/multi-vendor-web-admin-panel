import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const routname = '/DashboardScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(10),
      child: Text(
        'Dashboard',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
      ),
    );
  }
}
