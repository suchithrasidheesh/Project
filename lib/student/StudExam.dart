import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/student/StudExamResult.dart';

import 'StudNavigationBar.dart';

class StudExam extends StatelessWidget{
  var txt=['FirstTerm','SecondTerm','AnnualExam'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
        appBar: AppBar(
          title: Center(child: Text('EXAM',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
           leading: IconButton(onPressed:() {
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>StudNavigationBar()));
            }, icon:Icon(Icons.arrow_back_ios) ),
        ),
      body: ListView.builder(itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>StudExamResult()));
          },
          child: ListTile(
            tileColor: Colors.indigoAccent,
            title: Text(txt[index]),
          ),
        );
      },itemCount: txt.length,),
    );
  }

}