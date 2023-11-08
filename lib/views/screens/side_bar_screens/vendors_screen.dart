import 'package:flutter/material.dart';
import 'package:multi_vendor_app_admin_panel_web/views/screens/side_bar_screens/widgets/row_header_widget.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});
  static const routname = '/VendorsScreen';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Vendors',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          Row(
            children: [
              RowHeader('LOGO', 1),
              RowHeader('BUSSINESS NAME', 2),
              RowHeader('CITY', 2),
              RowHeader('STATE', 2),
              RowHeader('ACTION', 1),
              RowHeader('VIEW MORE', 1),
            ],
          )
        ],
      ),
    );
  }
}
