import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Models/Task/Task_model.dart';
import 'package:notes_app/views/widget/Edit_view_body_task.dart';

import '../Models/Note/Note_model.dart';

class Edit_view_task extends StatelessWidget {
  final Task_model? edittask;
  const Edit_view_task({super.key, this.edittask});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Edit_View_body_task(task:edittask),
      backgroundColor: Colors.white,
    );
  }
}
