import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});
  static const routname = '/WithdrawScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(10),
      child: Text(
        'Withdrawl',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
      ),
    );
  }
}
