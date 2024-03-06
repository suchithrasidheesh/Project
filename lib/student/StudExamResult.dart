import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/student/StudExam.dart';

class StudExamResult extends StatelessWidget{
  var subject=['English','Malayalam','Science','Maths','SocialScience'];
  var img=[''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: Center(child: Text('RESULT',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
           leading: IconButton(onPressed:() {
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>StudExam()));
              }, icon:Icon(Icons.arrow_back_ios) ),
        ),
      body: ListView.builder(itemBuilder: (context,index){
        return ListTile(

        );
      }),

    );
  }

}