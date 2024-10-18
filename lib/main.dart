import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Models/Task/Task_model.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/Notes/notes_cubit.dart';
import 'package:notes_app/cubits/Tasks/tasks_cubit.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'Models/Note/Note_model.dart';
import 'views/Home_view.dart';


void main() async {
  await Hive.initFlutter();
  Bloc.observer = simpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<Note_model>(primBox);
  await Hive.openBox<Task_model>(taskBox);
  runApp(Notes());
}

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit()),
        BlocProvider(create: (context) => TasksCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          home: Home_view()),
    );
  }
}
