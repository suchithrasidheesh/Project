import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/student/StudNavigationBar.dart';
import 'package:project/teacher/TeacherNavigation.dart';

import 'student/StudentLogin.dart';
import 'teacher/TeacherLogin.dart';

class SelectLogin extends StatelessWidget{

  User? user=FirebaseAuth.instance.currentUser;
  User? teacher=FirebaseAuth.instance.currentUser;
  @override
  Widget item(Widget Image,Widget Text,BuildContext context){
    return ClipRRect(borderRadius: BorderRadius.circular(20),
      child: Container(
          height: 100,width: 100,
          child:Card(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:5),
                  child: Image,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:75),
                  child: Center(child: Text),
                )
              ],
            ),
          )
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.png'),fit: BoxFit.fill)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Text('Please select your account type',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      user == null ? Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>StudentLogin()))
                          : Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>StudNavigationBar()));
                      //Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>StudentLogin()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: item(Image(image: AssetImage('assets/images/student.png'),height: 70,width:double.infinity,),
                          Text('Student',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),context),
                    ),
                  ),
                  SizedBox(width: 50,),
                  InkWell(
                    onTap: (){
                      teacher == null ? Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>TeacherLogin()))
                          : Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>TeacherNavigation()));

                      },
                    child: item(Image(image: AssetImage('assets/images/teacher.png'),height: 70,width:double.infinity,),
                        Text('Teacher',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),context),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 15,left: 60),
              //   child: OutlinedButton(onPressed: (){
              //     Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>AdminLogin()));
              //   }, child:Text('AdminLogin'),style: OutlinedButton.styleFrom(foregroundColor: Colors.orange),),
              // )
            ],
          ),
        ),
      )
    );
  }
}