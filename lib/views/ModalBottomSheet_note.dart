import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/Notes/notes_cubit.dart';
import 'package:notes_app/views/widget/Add_Note.dart';

import '../cubits/add_note/AddNoteCubit.dart';

import 'Notes_View.dart';

class Modalbuttonsheet_note extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddNoteCubit>(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
        if (state is AddNoteFailure) {
          print("failed ${state.errMessage}");
        }
        if (state is AddNoteSuccess) {

          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
           Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Note_View();
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
                child: AddNote(),
              ),
            ));
      }),
    );
  }
}

