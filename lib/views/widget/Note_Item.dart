import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/Notes/notes_cubit.dart';


import '../../Models/Note/Note_model.dart';
import '../../constant.dart';

import '../Edit_view.dart';


class note_item extends StatelessWidget {
   note_item({required this.note});
  final Note_model note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return Edit_view_note(editnote: note, );
        }));
      },
      child: Container(
        margin: EdgeInsets.only(bottom:12,right: 16,left: 16 ),
        padding: EdgeInsets.only(left:16,top: 20,bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xffb2b635),
          ),
          child: Column( crossAxisAlignment: CrossAxisAlignment.end,
              children: [
            ListTile(
              title: Text(note.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 25)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0,bottom: 14),
                child: Text(note.subTitle,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w400,
                        fontSize: 20)),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                },
                icon:Icon(Icons.delete,size: 32,color: Colors.black.withOpacity(0.65),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(note.date,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.w400,
                      fontSize: 18)),
            ),
          ])),
    );
  }
}
