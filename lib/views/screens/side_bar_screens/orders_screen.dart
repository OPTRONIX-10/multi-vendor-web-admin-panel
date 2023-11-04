import 'package:flutter/material.dart';

class OrdersScren extends StatelessWidget {
  const OrdersScren({super.key});
  static const routname = '/OrdersScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(10),
      child: Text(
        'Orders',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
      ),
    );
  }
}
