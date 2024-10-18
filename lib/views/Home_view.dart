import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../Models/Note/Note_model.dart';
import '../constant.dart';
import 'Main_view.dart';
import 'Notes_View.dart';


class Home_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(height: 800,
            child: Column(
            children: [
        Container(
        child: Lottie.asset("assets/images/Animation - 1728578840243.json"),
        padding: EdgeInsets.only(top: 100),
      ),
      Container(
      child: Text("Dooit",
      style: TextStyle(
      fontSize: 50,
      color: Colors.white,
      fontWeight: FontWeight.w900)),
      padding: EdgeInsets.only(top: 20)),
      Container(
      child: Text(
      "Write what you need",
      style: TextStyle(
        fontFamily:"Pattaya" ,
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.normal),
      ),
      padding: EdgeInsets.only(top: 10)),
      Container(
      child: Text(
      "to do.Everyday.",
      style: TextStyle(
      fontSize: 24,
          fontFamily:"Pattaya" ,
      color: Colors.white,
      fontWeight: FontWeight.normal),
      ),
      ),
      Padding(
      padding: const EdgeInsets.only(top:70.0),
      child: ElevatedButton(
      onPressed: () {

        Navigator.push(
           context, MaterialPageRoute(builder: (context) => Main_view()));
        //Navigator.pop(context);
        // if(BlocProvider.of<TasksCubit>(context).notes?.isNotEmpty??true) {
        //   //BlocProvider.of<TasksCubit>(context).notes;
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => Main_view()));
        //   BlocProvider.of<TasksCubit>(context).fetchAllNotes();
        // }
        // else
        //   {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Task_view()));
        //     BlocProvider.of<TasksCubit>(context).fetchAllNotes();
        //   }
      },
      child: Text("Continue",
      style: TextStyle(
      fontSize: 20,
      color: primColor,
      fontWeight: FontWeight.w500)),
      style: ElevatedButton.styleFrom(
      minimumSize: Size(220, 50),
      backgroundColor: Colors.white,
      )),
      ),
      ],
      )),
    );
    }
  }
