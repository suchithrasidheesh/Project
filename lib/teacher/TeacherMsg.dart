import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/teacher/TeacherNavigation.dart';

import '../widget/group.dart';
import '../widget/individual.dart';


class TeacherMessage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('MESSAGES',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          leading: IconButton(onPressed:() {
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>TeacherNavigation()));
          }, icon:Icon(Icons.arrow_back_ios) ),
          bottom: TabBar(tabs: [
            Tab(text: 'Individual ',),
            Tab(text: 'Group ',)
          ],),
        ),
        body: TabBarView(
          children: [
            individual(),
            group(),

          ],
        ),

      ),
    );
  }

}