import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/teacher/Exam.dart';
import 'package:project/teacher/Notice.dart';
import 'package:project/teacher/TeacherActivity.dart';
import 'package:project/teacher/TeacherHomework.dart';
import 'package:project/teacher/TeacherMsg.dart';
import 'package:project/teacher/TimeTable.dart';

import '../Helper/TeacherHelper.dart';
import 'TeacherLogin.dart';

class TeacherHome extends StatefulWidget{
  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title:Text('Welcome...',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) ,
            actions: [
              InkWell(
                  onTap: (){
                    TeacherHelper().logout().then((value) =>Get.to(()=>TeacherLogin()));
                  },
                  child: Icon(Icons.logout,color: Colors.indigo,size: 30,)),
            ],
            bottom: AppBar(
                title:SizedBox(height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon:Icon(Icons.search),
                        hintText: 'search anything....'
                    ),
                  ),
                )
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 35,left: 20,right:30),
              child: ClipRRect(borderRadius: BorderRadius.circular(10),
                child: Container(height: 200,width: double.infinity,
                  color: Colors.pinkAccent[100],
                  child: Padding(
                    padding: const EdgeInsets.only(top:0.1),
                    child: Image(image: AssetImage('assets/images/images.png'),fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child:Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                      children:[
                        const SizedBox(width: 15,),
                        TeacherActivity(icn:Icon(Icons.note_alt), txt:'Exam', clr:Colors.blueGrey,
                           tap: () { Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Exam())); },),
                        SizedBox(width: 25,),
                        TeacherActivity(icn:Icon(Icons.note), txt:'TimeTable', clr:Colors.orangeAccent,
                          tap: () {Get.to(()=>TimeTable());  },),
                        SizedBox(width: 30,),
                        TeacherActivity(icn:Icon(Icons.home_work), txt:'HomeWork', clr:Colors.blueAccent,
                          tap: () { Get.to(()=>homeWork()); },),
                        SizedBox(width: 35,),
                        TeacherActivity(icn:Icon(Icons.message), txt:'Message', clr:Colors.pinkAccent,
                          tap: () {Get.to(()=>TeacherMessage());  },),
                        SizedBox(width: 25,),
                      TeacherActivity(icn:Icon(Icons.mail), txt:'Notice', clr:Colors.orangeAccent,
                        tap: () {Get.to(()=>Notice());  },),
                      // SizedBox(width: 25,),
                      // TeacherActivity(icn:Icon(Icons.train_outlined), txt:'BusTracking', clr:Colors.green,
                      //   tap: () { Get.to(()=>TeacherMessage()); },),
                      ]),

                ],
              )
          ),
          SliverToBoxAdapter(
            child:Column(
              children: [
                SizedBox(height: 20,),
                CarouselSlider(
                    items:[
                      Image(image: AssetImage('assets/images/te1.png')),
                      Image(image: AssetImage('assets/images/te2.png')),
                      Image(image: AssetImage('assets/images/te3.png')),
                      Image(image: AssetImage('assets/images/te4.png')),
                      Image(image: AssetImage('assets/images/te5.png')),
                    ],
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                    ),),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right:30),
              child: ClipRRect(borderRadius: BorderRadius.circular(10),
                child: Container(height: 130,width: double.infinity,
                  color: Colors.pinkAccent[100],
                  child: Padding(
                    padding: const EdgeInsets.only(top:0.1),
                    child: Image(image: AssetImage('assets/images/te6.png'),fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
