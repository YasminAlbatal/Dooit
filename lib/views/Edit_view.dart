import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/views/widget/Edit_view_body.dart';

import '../Models/Note/Note_model.dart';

class Edit_view_note extends StatelessWidget {
  final Note_model? editnote;
  const Edit_view_note({super.key, this.editnote});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Edit_View_body_note(note:editnote),
      backgroundColor: Colors.white,
    );
  }
  }