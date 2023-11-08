import 'package:flutter/material.dart';
import 'package:multi_vendor_app_admin_panel_web/views/screens/side_bar_screens/widgets/row_header_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  static const routname = '/ProductScreen';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Products',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          Row(
            children: [
              RowHeader('IMAGE', 1),
              RowHeader('NAME', 3),
              RowHeader('PRICE', 2),
              RowHeader('QUANTITY', 2),
              RowHeader('ACTION', 1),
              RowHeader('VIEW MORE', 1),
            
            ],
          )
        ],
      ),
    );
  }
}
