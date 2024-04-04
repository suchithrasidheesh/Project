import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/teacher/TeacherHome.dart';

class homeWork extends StatefulWidget{
  @override
  State<homeWork> createState() => _homeWorkState();
}

class _homeWorkState extends State<homeWork> {

  final cls_cntrl=TextEditingController();
  final div_cntrl=TextEditingController();
  final sub_cntrl=TextEditingController();
  final wrk_cntrl=TextEditingController();
  late CollectionReference data;

  @override
  void initState() {
    data=FirebaseFirestore.instance.collection('HomeWork');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
        title: Center(child: Text('HomeWork')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: cls_cntrl,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Class'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: div_cntrl,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Division'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: sub_cntrl,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Subject'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: wrk_cntrl,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'work'),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()async{
              pubishHomework();
             }, child:Text('Publish now')),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Get.off(()=>TeacherHome());
             }, child:Text('Back')),
          ],
        ),
      ),
    );
  }

  Future<void> pubishHomework() async{
    if(cls_cntrl.text.isNotEmpty&&div_cntrl.text.isNotEmpty&&sub_cntrl.text.isNotEmpty&&wrk_cntrl.text.isNotEmpty){
      await data.add({
        'Class':cls_cntrl.text,
        'Division':div_cntrl.text,
        'Subject':sub_cntrl.text,
        'Work':wrk_cntrl.text,
      }).then((value){
       print('Add successfully');
       cls_cntrl.clear();
       div_cntrl.clear();
       sub_cntrl.clear();
       wrk_cntrl.clear();
      }).catchError((e){
        print('Error');
      });
    }else{
      showDialog(
          context: context,
          builder:(BuildContext context){
            return AlertDialog(
              title: Text('Error'),
              content: Text('All fields are nessesary to fill'),
            );
          }
      );
    }


  }
}