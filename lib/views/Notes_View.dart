import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/Notes/notes_cubit.dart';
import 'package:notes_app/views/search.dart';
import 'package:notes_app/views/widget/custom_app_bar.dart';
import 'package:notes_app/views/widget/list_notes_view.dart';
import '../constant.dart';

import 'ModalBottomSheet_note.dart';

class Note_View extends StatefulWidget {
  @override
  State<Note_View> createState() => _Note_ViewState();
}

class _Note_ViewState extends State<Note_View> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white.withOpacity(0.99),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context, builder: (context) {
              return Modalbuttonsheet_note();
            });
          },
          child: Icon(
            Icons.add,
            color: primColor,
          ),
        ),
        body: Column(
          children: [Padding(
            padding: const EdgeInsets.only(right: 270.0,top: 50),
            child: custom_app_bar(title:"Notes"),
          ),
          Expanded(child: List_Notes_View())],
        ));
  }
}
