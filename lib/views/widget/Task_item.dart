import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Models/Task/Task_model.dart';
import 'package:notes_app/cubits/Tasks/tasks_cubit.dart';
import 'package:notes_app/views/Edit_view_task.dart';
import '../../constant.dart';


class task_item extends StatefulWidget {
  task_item({required this.task});
  final Task_model task;


  @override
  State<task_item> createState() => _task_itemState();
}

class _task_itemState extends State<task_item> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Edit_view_task(edittask: widget.task,);
        }));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 12, right: 16, left: 16),
          padding: EdgeInsets.only(left: 16, top: 20, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xffa5ae2a)
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  onTap: () => TaskCompletion(widget.task),
                  leading: Icon(
                    widget.task.isCompleted ? Icons.check_box : Icons
                        .check_box_outline_blank,
                    color: Colors.black,
                  ),
                  title: Text(widget.task.title,
                      style: TextStyle(
                          decoration: widget.task.isCompleted ? TextDecoration.lineThrough : null,

                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 25)),

                  trailing: IconButton(
                    onPressed: () {
                      widget.task.delete();
                      BlocProvider.of<TasksCubit>(context).fetchAllTasks();
                    },
                    icon: Icon(Icons.delete, size: 32,
                      color: Colors.black.withOpacity(0.65),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Text(widget.task.date,
                      style: TextStyle(

                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                ),
              ])),
    );
  }

  void TaskCompletion(Task_model tas_com) {
    setState(() {
      tas_com.isCompleted = !tas_com.isCompleted;
    });
  }
}
