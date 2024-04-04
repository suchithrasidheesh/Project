import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'StudNavigationBar.dart';


class StudNotice extends StatelessWidget{
  var title=['25-12-2023','26-01-2024','22-03-2024','26-03-2024'];
  var subtitle=['Christmas Vaccation..','RepulicDay','WaterDay','Holiday and Vacation...'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
        appBar: AppBar(
           title: Center(child: Text('NOTICE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
           leading: IconButton(onPressed:() {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>StudNavigationBar()));
             }, icon:Icon(Icons.arrow_back_ios) ),
        ),
      body:ListView.builder(itemBuilder:(context,index){
        return ListTile(
          tileColor: Colors.pink[100],
          leading: Icon(Icons.calendar_month),
          title: Text(title[index]),
          subtitle: Text(subtitle[index]),

        );
      },itemCount:title.length,) ,
    );
  }

}