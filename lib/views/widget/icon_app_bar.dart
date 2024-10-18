import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Icon_app_bar extends StatelessWidget {
  final IconData icon;
  final void Function()? ontap;
  Icon_app_bar({ required this.icon, this.ontap, });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap :ontap,
      child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black.withOpacity(0.02),
      ),
      child: Center(child: Icon(icon,size: 32,),),
    ));
  }
}
