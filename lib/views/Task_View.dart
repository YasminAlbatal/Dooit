import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/Notes/notes_cubit.dart';
import 'package:notes_app/cubits/Tasks/tasks_cubit.dart';
import 'package:notes_app/views/ModelBottomSheet_task.dart';
import 'package:notes_app/views/search.dart';
import 'package:notes_app/views/widget/custom_app_bar.dart';
import 'package:notes_app/views/widget/icon_app_bar.dart';
import 'package:notes_app/views/widget/list_notes_view.dart';
import 'package:notes_app/views/widget/list_tasks_view.dart';
import '../constant.dart';

import 'ModalBottomSheet_note.dart';

class Task_View extends StatefulWidget {
  @override
  State<Task_View> createState() => _Task_ViewState();
}

class _Task_ViewState extends State<Task_View> {
  @override
  void initState() {
    BlocProvider.of<TasksCubit>(context).fetchAllTasks();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white.withOpacity(0.99),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Modalbuttonsheet_task();
                });
          },
          child: Icon(
            Icons.add,
            color: primColor,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              width: 400,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 25,top: 50),
                child: Row(
                  children: [
                    custom_app_bar(title: "Tasks",),
                    SizedBox(width: 220),
                    Icon_app_bar(icon:Icons.search,ontap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SearchView()));
                    })
                  ],
                ),
              ),
            ),
            Expanded(child: List_Tasks_View())
          ],
        ));
  }
}
