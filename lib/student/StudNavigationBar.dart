import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/student/StudMessage.dart';
import 'package:project/student/StudentProfile.dart';

import 'StudHome.dart';


class StudNavigationBar extends StatefulWidget{
  @override
  State<StudNavigationBar> createState() => _StudNavigationBarState();
}

class _StudNavigationBarState extends State<StudNavigationBar> {
  var screen=[
    StudHome(),
    StudMessage(),
    stuProfile(),
  ];
  int index=0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screen[index],
      bottomNavigationBar:BottomNavigationBar(
          selectedItemColor:Colors.blueAccent,
          unselectedItemColor: Colors.green,
          currentIndex:index,
          onTap: (tap){
            setState(() {
              index=tap;
            });
          },
          items:[
            BottomNavigationBarItem(icon:Icon(Icons.home,),label: 'Home',backgroundColor: Colors.blueGrey),
            BottomNavigationBarItem(icon:Icon(Icons.message),label: 'Message'),
            BottomNavigationBarItem(icon:Icon(Icons.person),label: 'Profile'),
          ]),
    );
  }
}
