import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/Models/Task/Task_model.dart';
import 'package:notes_app/cubits/AddTask/AddTask_cubit.dart';
import 'package:notes_app/cubits/AddTask/AddTask_cubit.dart';
import 'TextField.dart';
import 'custom_Button.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}
class _AddTaskState extends State<AddTask> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 10,),
          Textfield(
            onsaved: (value) {
              title = value;
            },
            title: "Title",
          ),
          SizedBox(height: 30,),
          BlocBuilder<AddTaskCubit,AddTaskState>(
            builder: (context,state)
            {
              return custom_Button(
                isLoading: state is AddTaskLoading ?true:false,
                ontap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate=DateTime.now();
                    var formattedCurrentDate=DateFormat('dd/m/yyyy').format(currentDate);

                    var taskmodel = Task_model(
                        title: title!,
                        date:formattedCurrentDate,
                      color: Colors.pinkAccent.value,
                        );
                    BlocProvider.of<AddTaskCubit>(context).addTask(taskmodel);

                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {
                    });
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

