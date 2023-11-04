import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});
  static const routname = '/VendorsScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(10),
      child: Text(
        'Vendors',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
      ),
    );
  }
}
