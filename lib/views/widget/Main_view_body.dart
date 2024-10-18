import 'package:flutter/material.dart';
import 'package:notes_app/views/Main_view.dart';
import 'package:notes_app/views/Notes_View.dart';
import 'package:notes_app/views/Task_View.dart';

import '../ModalBottomSheet_note.dart';
import '../search.dart';
import 'custom_app_bar.dart';

class Main_view_body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
            height: 580,
            child: Column(children: [
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(right: 270.0),
                child: custom_app_bar(title: "Dooit"),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 60,
                width: 450,
                child: Row(
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Note_View()));
                        },
                        child: Text(
                          "Notes",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.99)),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 50),
                          backgroundColor: Color(0xff90CAF9),
                        )),
                    SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Task_View()));},
                      child: Text(
                        "Tasks",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.99)),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 50),
                        backgroundColor: Color(0xff90CAF9),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                  ],
                ),

              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(child: Image.asset('assets/images/checklist.png'),width: 400,height: 250,),
              //Image.asset('assets/images/checklist.png'),
              SizedBox(
                height: 50,
              ),
              Text(
                "Create Your Note",
                style: TextStyle(
                    fontFamily: "Pattaya",
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              // SizedBox(
              //   height: 30,
              // ),
            ])),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Modalbuttonsheet_note();
                });
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color:Color(0xff26A69A)),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 26.0),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              Center(
                child: Text(
                  "  New Note",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ]),
            height: 60,
            width: 210,
          ),
        ),
        SizedBox(height: 20,),

      ],
    ));
  }
}
