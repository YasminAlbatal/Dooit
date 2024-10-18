import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'icon_app_bar.dart';

class custom_app_bar extends StatelessWidget {
  final String? title;

  custom_app_bar({required this.title,});
  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        fontFamily: "Pattaya"
      ),
    );
  }
}
