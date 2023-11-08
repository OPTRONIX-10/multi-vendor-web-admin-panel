import 'package:flutter/material.dart';
import 'package:multi_vendor_app_admin_panel_web/views/screens/side_bar_screens/widgets/row_header_widget.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});
  static const routname = '/WithdrawScreen';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Withdrawl',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          Row(
            children: [
              RowHeader('NAME', 1),
              RowHeader('AMOUNT', 3),
              RowHeader('BANK NAME', 2),
              RowHeader('BANK ACCOUNT', 2),
              RowHeader('EMAIL', 1),
              RowHeader('PHONE', 1),
            ],
          )
        ],
      ),
    );
  }
}
