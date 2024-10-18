import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Models/Task/Task_model.dart';
import 'package:notes_app/cubits/Tasks/tasks_cubit.dart';
import 'package:notes_app/views/widget/Task_item.dart';

class List_Tasks_View extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit,TasksState>(
        builder: (context,state)
        {
          List<Task_model>tasks=BlocProvider.of<TasksCubit>(context).tasks!;
          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: tasks.length,
              itemBuilder: (context,index){
                return task_item(task: tasks[index]);
              });
        });
  }
}

