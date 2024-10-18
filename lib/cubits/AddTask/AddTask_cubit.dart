import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/Models/Task/Task_model.dart';
import 'package:notes_app/constant.dart';

part 'AddTask_state.dart';
class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super (AddTaskInitial());

  addTask(Task_model task) async {

    emit(AddTaskLoading());
    try {
      var notesBox = Hive.box<Task_model>(taskBox);
      await notesBox.add(task);
      emit(AddTaskSuccess());
    } catch (e) {
      emit( AddTaskFailure(e.toString()));
    }
  }
}