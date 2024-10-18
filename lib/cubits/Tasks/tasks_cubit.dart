import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/Models/Task/Task_model.dart';
import '../../constant.dart';
part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
   List<Task_model>?tasks;

  fetchAllTasks() {
    var tasksBox = Hive.box<Task_model>(taskBox);
    tasks = tasksBox.values.toList();
    emit(TasksSuccess());
  }
}