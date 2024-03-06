import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/student/StudNavigationBar.dart';

class StudentEventsHome extends StatelessWidget{
  var txt=['Sports Day','Republic Day','Yoga Day','GrandParents Day','Arts Day'];
  var img=['assets/images/sports.png','assets/images/republc.png','assets/images/yoga.png','assets/images/grndparnt.png','assets/images/arts.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('UPCOMING EVENTS',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
      body: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing:10,crossAxisSpacing:10),
          itemBuilder:(context,index){
              return Column(
                children: [
                  SizedBox(height: 15,),
                  ClipRRect(borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 100,width: 100,
                      child: Image(image: AssetImage(img[index]),fit:BoxFit.cover,),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(txt[index],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.only(left: 60,top: 5),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month),
                        Text('28-02-2024'),
                      ],
                    ),
                  )
                ],
              );
          },itemCount:img.length,),
    );
  }

}