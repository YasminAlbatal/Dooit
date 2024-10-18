import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/AddTask/AddTask_cubit.dart';
import 'package:notes_app/cubits/Notes/notes_cubit.dart';
import 'package:notes_app/cubits/Tasks/tasks_cubit.dart';
import 'package:notes_app/views/Task_View.dart';
import 'package:notes_app/views/widget/add_task.dart';


import '../cubits/add_note/AddNoteCubit.dart';



class Modalbuttonsheet_task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddTaskCubit>(
      create: (context) => AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
          listener: (context, state) {
            if (state is AddTaskFailure) {
              print("failed ${state.errMessage}");
            }
            if (state is AddTaskSuccess) {

              BlocProvider.of<TasksCubit>(context).fetchAllTasks();
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Task_View();
                },
              ));
            }

          }, builder: (context, state) {
        return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  right: 24,
                  left: 24,
                  top: 25,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: AddTask(),
              ),
            ));
      }),
    );
  }
}

