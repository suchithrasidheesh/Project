import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/Helper/TeacherHelper.dart';
import 'package:project/teacher/TeacherLogin.dart';


class teacherRegistration extends StatefulWidget {
  @override
  State<teacherRegistration> createState() => _teacherRegistrationState();
}

class _teacherRegistrationState extends State<teacherRegistration> {

  final email_control=TextEditingController();
  final pass_control=TextEditingController();
  final name_cntrl=TextEditingController();
  late CollectionReference register;


  @override
  void initState() {
    register=FirebaseFirestore.instance.collection('TeacherData');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
        body: Column(children: [
          SizedBox(height: 50,),
          Center(
           child: Text('Registration Form', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 40),
            child: TextField(
              controller:name_cntrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  labelText: 'Name'),),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 40),
             child: TextField(
               controller:email_control,
              decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              labelText: 'Email'),),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 40),
            child: TextField(
              controller:pass_control,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            labelText: 'password',
          ),),),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: ()async{
            registerTeacher();
          },
              child:Text("Register")),
    ]));
  }

 Future<void> registerTeacher()async {
   final emailvald=EmailValidator.validate(email_control.text);
   if(emailvald==true&&email_control.text.isNotEmpty&&pass_control.text.isNotEmpty&&name_cntrl.text.isNotEmpty){
     await register.add({
          'Email':email_control.text,
          'Password':pass_control.text,
          'Name':name_cntrl.text,
     }).then((value) {
       TeacherHelper().register(email:email_control.text, pwd:pass_control.text)
           .then((value){
         if(value==null){
           Get.to(()=>TeacherLogin());
         }
     });
       email_control.clear();
       pass_control.clear();
       name_cntrl.clear();

     }).catchError((e){
       print('Failed to add teacher $e');
     });

   }
 }
}

