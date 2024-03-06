import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/student/StudExam.dart';
import 'package:project/student/StudMessage.dart';
import 'package:project/student/StudentActivity.dart';
import 'package:project/student/StudentEvents.dart';
import 'package:project/student/StudentEventsHome.dart';
import 'package:project/student/StudentHomework.dart';

class StudHome extends StatelessWidget{
  var listtxt=['Attendence','Exam','Fees','HomeWork','Message','Notice','BusTracking'];

  var Icn=[Icons.calendar_month_sharp,Icons.note_alt_sharp,Icons.book_outlined,
    Icons.home_work,Icons.message_outlined,Icons.notes,Icons.train];

  var clr=[Colors.blueGrey,Colors.purpleAccent,Colors.greenAccent,Colors.blueAccent,Colors.orangeAccent,
    Colors.pinkAccent,Colors.purple,Colors.green,];



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title:Text('ROBERT.R',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) ,
            actions: [
              SizedBox(width: 20,),
              CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Boy.png')) ,
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
          SliverGrid.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4),
            itemBuilder: (context,index){
              return Column(
                children: [
                  SizedBox(height: 40,),
                  StudentActivity(icn: Icon(Icn[index]), txt:listtxt[index], clr: clr[index], onpress: ()=>tapped(index),),
                ],
              );
            },itemCount:listtxt.length,),
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

        ],
      ),

    );
  }

 void tapped(int index) {
    if(index==0){
      Navigator.pushReplacement(context as BuildContext,MaterialPageRoute(builder:(context)=>StudExam()));
    }
    else if(index==1){
      Navigator.pushReplacement(context as BuildContext,MaterialPageRoute(builder:(context)=>StudMessage()));
    }
 }
}