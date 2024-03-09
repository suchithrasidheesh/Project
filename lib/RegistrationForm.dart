
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/Verification.dart';

class RegistrationForm extends StatelessWidget{

  var size,ht,wt;
  final filestore=FirebaseFirestore.instance;
  File? image;
  get data=>null;
  var name_cntrlr=TextEditingController();
  var ad_cntrlr=TextEditingController();
  var class_cntrlr=TextEditingController();
  var Fathername_cntrlr=TextEditingController();
  var PH_cntrlr=TextEditingController();
  var Eml_cntrlr=TextEditingController();


  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    ht=size.height;
    wt=size.width;
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: ht,
            child: Column(
              children: [
                SizedBox(height: 30,),
                Center(child: Text('Registration Form',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.only(left:30,right: 40),
                  child: TextField(
                    controller: name_cntrlr,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      labelText: 'Name'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 40),
                  child: TextField(
                    controller: ad_cntrlr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        labelText: 'Admission Number',
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 40),
                  child: TextField(
                    controller: class_cntrlr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        labelText: 'Class'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 40),
                  child: TextField(
                    controller: Fathername_cntrlr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        labelText: 'FatherName'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 40),
                  child: TextField(
                    controller: PH_cntrlr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        labelText: 'Phone Number'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 40),
                  child: TextField(
                    controller: Eml_cntrlr,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        labelText: 'E-mail'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 150,width: 300,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                              child:image==null?Text('No image selected.'):Image.file(image!),
                        ),
                        ElevatedButton(onPressed: ()async{

                          final studimage=await ImagePicker().pickImage(source:ImageSource.gallery);
                          if(studimage!=null){
                            image=File(studimage.path);
                          }
                         }, child: Text('Select Image')),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: ()async{
                  if(name_cntrlr.text.isNotEmpty&&class_cntrlr.text.isNotEmpty&&ad_cntrlr.text.isNotEmpty&&
                  Fathername_cntrlr.text.isNotEmpty&&PH_cntrlr.text.isNotEmpty&&Eml_cntrlr.text.isNotEmpty&&
                  image.toString().isNotEmpty){
                    showDialog(
                        context: context,
                        builder:(BuildContext context){
                          return AlertDialog(
                            title: Text('Confirmation'),
                            content: Text('Are you sure you want to submit these details?'),
                            actions: [
                              TextButton(onPressed:(){

                                name_cntrlr.clear();
                                class_cntrlr.clear();
                                ad_cntrlr.clear();
                                Fathername_cntrlr.clear();
                                PH_cntrlr.clear();
                                Eml_cntrlr.clear();
                                Navigator.of(context).pop();
                               }, child:Text('Cancel')),
                              TextButton(onPressed:()async{
                                var imagename=DateTime.now().microsecondsSinceEpoch.toString();
                                var storageRef=FirebaseStorage.instance.ref().child('studentimage/${imagename}');
                                var uploadtask=storageRef.putFile(image!);
                                var downloadurl=await(await uploadtask).ref.getDownloadURL();
                                
                                filestore.collection('StudentsData').add({
                                  'AdNo':ad_cntrlr.text,
                                  'FatherName':Fathername_cntrlr.text,
                                  'Name':name_cntrlr.text,
                                  'PhoneNumber':PH_cntrlr.text,
                                  'Class':class_cntrlr.text,
                                  'email':Eml_cntrlr.text,
                                  'Image':downloadurl.toString(),
                                });
                                Navigator.of(context).pop();
                                name_cntrlr.clear();
                                class_cntrlr.clear();
                                ad_cntrlr.clear();
                                Fathername_cntrlr.clear();
                                PH_cntrlr.clear();
                                Eml_cntrlr.clear();
                                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Verification()));


                               }, child:Text('Submit'))
                            ],
                          );
                        });
                  }

                 }, child:Text('SignUp')),
                SizedBox(height: 10,),
                TextButton(onPressed: (){}, child:Text('You are a registered user LoginHere!!'))
              ],
            ),
          ),
        ),
      ),
    );
  }

}