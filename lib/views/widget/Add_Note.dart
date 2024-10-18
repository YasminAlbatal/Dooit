import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../Models/Note/Note_model.dart';
import '../../cubits/add_note/AddNoteCubit.dart';
import 'TextField.dart';
import 'custom_Button.dart';

class AddNote extends StatefulWidget {
  @override
  State<AddNote> createState() => _AddNoteState();
}
class _AddNoteState extends State<AddNote> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          Textfield(
            onsaved: (value) {
              title = value;
            },
            title: "Title",
          ),
          SizedBox(
            height: 20,
          ),
          Textfield(
            onsaved: (value) {
              subTitle = value;
            },
            title: "content",
            maxline: 6,
          ),
          SizedBox(
            height: 20,
          ),


          SizedBox(
            height: 30,
          ),
          BlocBuilder<AddNoteCubit,AddNoteState>(
            builder: (context,state)
            {
            return custom_Button(
              isLoading: state is AddNoteLoading ?true:false,
              ontap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var currentDate=DateTime.now();
                  var formattedCurrentDate=DateFormat('dd/m/yyyy').format(currentDate);

                  var notemodel = Note_model(
                      title: title!,
                      subTitle: subTitle!,
                      date:formattedCurrentDate,
                      color: Colors.pinkAccent.value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
            
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {
                  });
                }
              },
            );
            },
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

