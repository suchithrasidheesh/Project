import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/student/StudExam.dart';

class StudExamResult extends StatelessWidget{
  var subject=['English','Malayalam','Science','Maths','SocialScience'];
  var mark=['60/100','75/100','90/100','85/100','97/100'];
  var clr=[Colors.pinkAccent,Colors.purpleAccent,Colors.cyanAccent,Colors.indigoAccent,Colors.lightGreenAccent];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
        appBar: AppBar(
           title: Center(child: Text('RESULT',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
           leading: IconButton(onPressed:() {
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>StudExam()));
              }, icon:Icon(Icons.arrow_back_ios) ),
        ),
      body: ListView.builder(itemBuilder: (context,index){
        return ListTile(
          tileColor: clr[index],
              title: Text(subject[index]),
              subtitle: Text(mark[index]),
        );
      },itemCount:subject.length ,),

    );
  }

}