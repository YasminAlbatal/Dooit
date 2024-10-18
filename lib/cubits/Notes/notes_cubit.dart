
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../../Models/Note/Note_model.dart';
import '../../constant.dart';
part 'notes_state.dart';


class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<Note_model>?notes;

  fetchAllNotes() {
    var notesBox = Hive.box<Note_model>(primBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }

}
