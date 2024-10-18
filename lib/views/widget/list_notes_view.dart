
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Models/Note/Note_model.dart';
import 'package:notes_app/cubits/Notes/notes_cubit.dart';
import 'Note_Item.dart';

class List_Notes_View extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesState>(
        builder: (context,state)
      {
        List<Note_model>notes=BlocProvider.of<NotesCubit>(context).notes!;
      return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: notes.length,

          itemBuilder: (context,index){
        return note_item(note: notes[index]);
      });
  });
  }
}

