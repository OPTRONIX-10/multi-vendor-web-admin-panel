import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  static const routname = '/CategoriesScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(10),
      child: Text(
        'Categories',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
      ),
    );
  }
}
