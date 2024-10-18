import 'package:flutter/material.dart';

import '../../constant.dart';

class Textfield extends StatelessWidget {
  final String? title;
  final int? maxline;
  final void Function(String?)? onsaved;
  final Function(String)? onChanged;
  Textfield({required this.title, this.maxline = 1, this.onsaved, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      onChanged: onChanged,
      validator:(value)
      {
        if(value?.isEmpty??true)
          {
            return "field is required";
          }
        else
          {
            return null;
          }
      },
      maxLines: maxline,
      cursorColor: primColor,
      decoration: InputDecoration(
          border: buildBorder(),
          hintText: title,
          hintStyle: TextStyle(color: primColor),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(primColor)),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.black));
}
