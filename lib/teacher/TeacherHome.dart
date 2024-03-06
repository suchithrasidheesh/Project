import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/teacher/TeacherActivity.dart';

class TeacherHome extends StatelessWidget{
  var listtxt=['Attendence','Timetable','HomeWork','Message','Notice','BusTracking'];

  var Icn=[Icons.calendar_month_sharp,Icons.note_alt_sharp,
    Icons.home_work,Icons.message_outlined,Icons.notes,Icons.train];

  var clr=[Colors.blueGrey,Colors.purpleAccent,Colors.blueAccent,Colors.orangeAccent,
    Colors.pinkAccent,Colors.purple,Colors.green,];



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title:Text('GEETHA.R',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) ,
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
                  child: Padding(
                    padding: const EdgeInsets.only(top:3,left: 200),
                    child: Image(image: AssetImage('assets/images/stu&tea.png'),),
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
                  TeacherActivity(icn: Icon(Icn[index]), txt:listtxt[index], clr: clr[index],),
                ],
              );
            },itemCount:listtxt.length,),
        ],
      ),

    );
  }
}
