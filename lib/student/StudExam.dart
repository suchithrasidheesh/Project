import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/student/StudHome.dart';


void main(){
  runApp(MaterialApp(home: StudExam(),));
}



class StudExam extends StatefulWidget{
  @override
  State<StudExam> createState() => _StudExam();
}

class _StudExam extends State<StudExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
        title: Text('Exam Result'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            InkWell(
              onTap: (){

              },
              child: Card(color: Colors.cyan,
                child: Container(height: 50,width: 100,
                  child: Center(child: Text('Frist Term\nExam')),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){

              },
              child: Card(color: Colors.purpleAccent[200],
                child: Container(height: 50,width: 100,
                  child: Center(child: Text('Second Term\nExam')),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){

              },
              child: Card(color: Colors.greenAccent[200],
                child: Container(height: 50,width: 100,
                  child: Center(child: Text('Annual Exam')),
                ),
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              Get.to(()=>StudHome());
            }, child:Text('Back'))
          ],
        ),
      ),
    );
  }
}