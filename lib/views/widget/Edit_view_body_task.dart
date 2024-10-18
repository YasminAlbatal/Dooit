import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Models/Task/Task_model.dart';
import 'package:notes_app/cubits/Tasks/tasks_cubit.dart';
//import 'package:notes_app/ views/ Edit_view_task. dart';
import 'TextField.dart';
import 'custom_app_bar.dart';

class Edit_View_body_task extends StatefulWidget {
  final Task_model? task;

  const Edit_View_body_task({super.key, this.task});

  @override
  State<Edit_View_body_task> createState() => _Edit_View_body_taskState();
}

class _Edit_View_body_taskState extends State<Edit_View_body_task> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Row(
          children: [
            SizedBox(width: 30,),
            custom_app_bar(title: "Edit  "),
            SizedBox(width: 250),
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                widget.task!.title = title ?? widget.task!.title;
               // widget.note!.subTitle = content ?? widget.note!.subTitle;
                widget.task!.save();
                BlocProvider.of<TasksCubit>(context).fetchAllTasks();
                Navigator.pop(context);
              },
            )
          ],
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          width: 380,
          child: Textfield(
            onChanged: (value) {
              title = value;
            },
            title: widget.task?.title,
            maxline: 1,
          ),
        ),

      ],
    );
  }
}
