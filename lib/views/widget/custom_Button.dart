import 'package:flutter/material.dart';

import '../../constant.dart';


class custom_Button extends StatelessWidget {
  final void Function()? ontap;
  final bool isLoading;

  const custom_Button({super.key, this.ontap, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
          width: 400,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: primColor,
          ),
          child: Center(
              child: isLoading
                  ? SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                  : Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
        ));
  }
}
