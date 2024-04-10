

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:project/Helper/FirebaseHelper.dart';
import 'package:project/student/StudExam.dart';
import 'package:project/student/StudMessage.dart';
import 'package:project/student/StudNotice.dart';
import 'package:project/student/StudentActivity.dart';
import 'package:project/student/StudentEvents.dart';
import 'package:project/student/StudentEventsHome.dart';
import 'package:project/student/StudentHomework.dart';
import 'package:project/student/StudentLogin.dart';

class StudHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title:Text('Welcome...',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) ,
            actions: [
              SizedBox(width: 40,),
              InkWell(
                onTap: (){
                  FirebaseHelper()
                      .logout()
                      .then((value) =>Get.to(StudentLogin()));
                },

                  child: Icon(Icons.logout,size: 20,)),
              SizedBox(height: 40,width: 20,),
            ],
            bottom: AppBar(
                title:SizedBox(height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        prefixIcon:Icon(Icons.search),
                        hintText: 'search anything....'
                    ),
                  ),
                )
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 15,left: 20,right:30),
              child: ClipRRect(borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.pinkAccent[100],
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 10),
                        child: Text('Check Updated Home \n work for you',
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70,left: 10),
                        child: OutlinedButton(onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>HomeWork()));
                        }, child: Text('Check Now')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:3,left: 200),
                        child: Image(image: AssetImage('assets/images/stu&tea.png'),),
                      )
                    ],
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
                    // SizedBox(width: 15,),
                    // StudentActivity(icn:Icon(Icons.calendar_month_sharp), txt:'Attendence', clr:Colors.blueGrey,
                    //   tap: () { Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>StudMessage())); },),
                    SizedBox(width: 45,),
                    StudentActivity(icn:Icon(Icons.note_alt_sharp), txt:'Exam', clr:Colors.purpleAccent,
                      tap: () { Get.to(()=>StudExam()); },),
                    // SizedBox(width: 30,),
                    // StudentActivity(icn:Icon(Icons.book_outlined), txt:'Fees', clr:Colors.greenAccent,
                    //   tap: () {Get.to(()=>StudMessage());  },),
                    SizedBox(width: 45,),
                    StudentActivity(icn:Icon(Icons.home_work), txt:'HomeWork', clr:Colors.blueAccent,
                      tap: () { Get.to(()=>HomeWork()); },),

                    SizedBox(width: 45,),
                    StudentActivity(icn:Icon(Icons.message), txt:'Message', clr:Colors.pinkAccent,
                      tap: () {Get.to(()=>StudMessage());  },),

                    SizedBox(width: 45,),StudentActivity(icn:Icon(Icons.note), txt:'Notice', clr:Colors.orangeAccent,
                      tap: () {Get.to(()=>StudNotice());  },)
              ],
            )
         ] ),),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Row(
                    children: [

                      Text('UpComing Events',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.only(left:150),
                        child: InkWell(
                            onTap:(){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>StudentEventsHome()));
                            },
                            child: Text('See all')),
                      )
                    ],),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      StudentsEvents(img: Image(image: AssetImage('assets/images/sports.png'),fit: BoxFit.fill,)),
                      SizedBox(width: 20,),
                      StudentsEvents(img: Image(image: AssetImage('assets/images/annual.png'),fit: BoxFit.fill,))
                    ],
                  ),

                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:  Column(
              children: [
                SizedBox(height: 30,),
                ClipRRect(borderRadius: BorderRadius.circular(20),
                  child: Container(height: 200,width: 300,
                    child: CarouselSlider(
                        items:[
                          Image(image: AssetImage('assets/images/teacher1.png')),
                          Image(image: AssetImage('assets/images/sports.png')),
                          Image(image: AssetImage('assets/images/republc.png')),
                          Image(image: AssetImage('assets/images/yoga.png')),

                        ],
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                        ),),
                  ),
                ),
              ],
            ),
          )

        ],
      ),

    );
  }


}