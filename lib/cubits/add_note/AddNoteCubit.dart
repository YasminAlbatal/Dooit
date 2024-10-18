import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../Models/Note/Note_model.dart';
import '../../constant.dart';
part 'AddNoteState.dart';
class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super (AddNoteInitial());

  addNote(Note_model note) async {

    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<Note_model>(primBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
     emit( AddNoteFailure(e.toString()));
    }
  }
}


