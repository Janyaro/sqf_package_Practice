import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReUseBtn extends StatelessWidget {
  String title;
  VoidCallback ontap;
  ReUseBtn({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 150,
        height: 50,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.deepPurple),
      ),
    );
  }
}
