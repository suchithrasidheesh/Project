import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/teacher/TeacherHome.dart';
import 'package:project/teacher/TeacherLogin.dart';
import 'package:project/teacher/TeacherMsg.dart';


import '../Helper/TeacherHelper.dart';


class TeacherNavigation extends StatefulWidget{
  @override
  State<TeacherNavigation> createState() => _TeacherNavigationState();
}

class _TeacherNavigationState extends State<TeacherNavigation> {
  var screen=[
    TeacherHome(),
    TeacherMessage(),

   // TeacherProfile()
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
            BottomNavigationBarItem(icon:InkWell(
                onTap: (){
                    TeacherHelper().logout().then((value) =>Get.to(()=>TeacherLogin()));
                },
                child: Icon(Icons.logout)),label: 'LogOut'),
          ]),
    );
  }
}

