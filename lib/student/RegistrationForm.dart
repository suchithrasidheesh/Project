

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/student/StudentLogin.dart';

import '../Helper/FirebaseHelper.dart';

class RegistrationForm extends StatefulWidget{

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final name_cntrlr=TextEditingController();
  final ad_cntrlr=TextEditingController();
  final class_cntrlr=TextEditingController();
  final Fathername_cntrlr=TextEditingController();
  final division_cntrlr=TextEditingController();
  final Eml_cntrlr=TextEditingController();
  final pass_cntrlr=TextEditingController();
  late CollectionReference usercollection;
  var size,ht,wt;
  final fkey=GlobalKey<FormState>();


  @override
  void initState() {
    usercollection=FirebaseFirestore.instance.collection('StudentsData');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    size=MediaQuery.of(context).size;
    ht=size.height;
    wt=size.width;


    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: fkey,
            child: Column(
              children: [
                SizedBox(height: 30,),
                Center(child: Text('Registration Form',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.only(left:30,right: 40),
                  child:TextFormField(
                    controller:name_cntrlr,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      labelText: 'Name'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 40),
                  child: TextFormField(
                    controller:ad_cntrlr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        labelText: 'Admission Number',
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 40),
                  child: TextFormField(
                    controller:Fathername_cntrlr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        labelText: 'FatherName'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 40),
                  child:TextFormField(
                    controller:class_cntrlr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        labelText: 'Class'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 40),
                  child: TextFormField(
                    controller: division_cntrlr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        labelText: 'Division'
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 40),
                  child: TextFormField(
                    controller:Eml_cntrlr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        labelText: 'E-mail'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 40),
                  child: TextFormField(
                    controller:pass_cntrlr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        labelText: 'Password'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: ()async{
                  registerStudents();
                  }, child:Text('Register')),

                SizedBox(height: 20,),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>StudentLogin()));
                 }, child:Text('You are a registered user LoginHere!!'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerStudents()async {
    if(fkey.currentState!.validate()) {
      final emailvalid = EmailValidator.validate(Eml_cntrlr.text);
      if (emailvalid == true&&name_cntrlr.text.isNotEmpty&&ad_cntrlr.text.isNotEmpty&&
          class_cntrlr.text.isNotEmpty&&Fathername_cntrlr.text.isNotEmpty&&
          division_cntrlr.text.isNotEmpty&&Eml_cntrlr.text.isNotEmpty&&pass_cntrlr.text.isNotEmpty) {
        await usercollection.add({
        'Name':name_cntrlr.text,
        'AdNo':ad_cntrlr.text,
        'Class':class_cntrlr.text,
        'FatherName':Fathername_cntrlr.text,
        'Division':division_cntrlr.text,
        'Email':Eml_cntrlr.text,
        'Password':pass_cntrlr.text,
        }).then((value){
          print('Students Registered Successfully...');
          FirebaseHelper().registerUser(email:Eml_cntrlr.text,pwd:pass_cntrlr.text).then((result){
            if(result==null){
              Get.to(()=> StudentLogin());
            }
          });
          name_cntrlr.clear();
          ad_cntrlr.clear();
          class_cntrlr.clear();
          Fathername_cntrlr.clear();
          division_cntrlr.clear();
          Eml_cntrlr.clear();
          pass_cntrlr.clear();
        }).catchError((e){
          print('Failed to add students $e');
        });

      }
      }
    }
}