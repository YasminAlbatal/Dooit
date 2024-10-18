import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Models/Task/Task_model.dart';
import 'package:notes_app/cubits/Tasks/tasks_cubit.dart';
import 'package:notes_app/views/widget/Task_item.dart';


class SearchView extends StatefulWidget {
  SearchView({
    super.key
  });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  List<Task_model>tasks_found = [];
//BlocProvider.of<AddTaskCubit>(context)
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.1),
            ),
            child: TextField(
              onChanged: (value) => searclist(value),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff795548),
                    size: 27,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 20,
                    maxWidth: 25,
                  ),
                  border: InputBorder.none,
                  hintText: '  Search',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Color(0xff795548),
                  )),
            ),
          ),
        ),
           SizedBox(height: 20,),

    Expanded(child: BlocBuilder<TasksCubit,TasksState>(
    builder: (context,state)
    {
      //List<Task_model>=BlocProvider.of<TasksCubit>(context).tasks!;
      return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: tasks_found.length,
          itemBuilder: (context,index){
            return task_item(task: tasks_found[index]);
          });
    })
    ),
  ]
    ));
  }
  void searclist(String text) {
    List<Task_model> result = [];
    var tasks_search = BlocProvider
        .of<TasksCubit>(context)
        .tasks;
    if (text.isNotEmpty) {
      result = tasks_search!
          .where(
            (element) =>
            element.title.toLowerCase().contains(
              text.toLowerCase(),
            ),
      )
          .toList();
      print(result);
    }
    setState(() {
      tasks_found = result;
    });
  }}


