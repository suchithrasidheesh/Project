import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'TeacherHome.dart';

class Notice extends StatefulWidget{
  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  
  final cls_cntl=TextEditingController();
  final divi_cntl=TextEditingController();
  final title_cntl=TextEditingController();
  final subtitle_cntl=TextEditingController();
  
  late CollectionReference notice;
  
  @override
  void initState() {
    notice=FirebaseFirestore.instance.collection('Notice');
    super.initState();
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
        backgroundColor: Colors.blueAccent[200],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: cls_cntl,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Class'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: divi_cntl,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Division'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: title_cntl,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Subject'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: subtitle_cntl,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'work'),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()async{
              pubishNotice();
            }, child:Text('Publish now')),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Get.to(()=>TeacherHome());
            }, child:Text('Back')),
          ],
        ),
      ),
    );
  }

  Future<void> pubishNotice() async{
    if(cls_cntl.text.isNotEmpty&&divi_cntl.text.isNotEmpty&&title_cntl.text.isNotEmpty&&subtitle_cntl.text.isNotEmpty){
      await notice.add({
        'Class':cls_cntl.text.toUpperCase(),
        'Division':divi_cntl.text.toUpperCase(),
        'Title':title_cntl.text.toUpperCase(),
        'Subtitle':subtitle_cntl.text.toUpperCase(),
      }).then((value){
        print('notice Added successfully....');
        cls_cntl.clear();
        divi_cntl.clear();
        title_cntl.clear();
        subtitle_cntl.clear();
      }).catchError((e){
        print('Error: $e');
      });
    }else{
        showDialog(
            context: context,
            builder:(BuildContext contex){
              return  AlertDialog(
                title: Text('Error'),
                content: Text(' fields are not filled'),
              );
            }
            );
    }


  }
}