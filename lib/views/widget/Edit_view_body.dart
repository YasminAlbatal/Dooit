import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/Notes/notes_cubit.dart';
import '../../Models/Note/Note_model.dart';

import 'TextField.dart';
import 'custom_app_bar.dart';

class Edit_View_body_note extends StatefulWidget {
  final Note_model? note;

  const Edit_View_body_note({super.key, this.note});

  @override
  State<Edit_View_body_note> createState() => _Edit_View_body_noteState();
}

class _Edit_View_body_noteState extends State<Edit_View_body_note> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Row(
          children: [
            SizedBox(width: 30,),
            custom_app_bar(title: "Edit  "),
            SizedBox(width: 250),
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                widget.note!.title = title ?? widget.note!.title;
                widget.note!.subTitle = content ?? widget.note!.subTitle;
                widget.note!.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 380,
          child: Textfield(
            onChanged: (value) {
              title = value;
            },
            title: widget.note?.title,
            maxline: 1,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 380,
          child: Textfield(
            onChanged: (value) {
              content = value;
            },
            title: widget.note?.subTitle,
            maxline: 7,
          ),
        )
      ],
    );
  }
}
