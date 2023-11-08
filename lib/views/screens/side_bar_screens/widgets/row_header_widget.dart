import 'package:flutter/material.dart';

class RowHeader extends StatelessWidget {
  final String text;
  final int flex;
  const RowHeader(this.text, this.flex);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.yellow[900],
          border: Border.all(color: Colors.grey.shade700),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
        ),
      ),
    );
    
  }
}
