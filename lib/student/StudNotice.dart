import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'StudNavigationBar.dart';

void main(){
  runApp(MaterialApp(home: StudNotice(),
    debugShowCheckedModeBanner: false,
  ));
}

class StudNotice extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: Center(child: Text('NOTICE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
           leading: IconButton(onPressed:() {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>StudNavigationBar()));
             }, icon:Icon(Icons.arrow_back_ios) ),
        ),
      body:ListView.builder(itemBuilder:(context,index){
        return ListTile(
          leading: Icon(Icons.calendar_month),
          title: Text('10-01-2024'),
          subtitle: Text('Holiday and Vacation...'),

        );
      },itemCount:3,) ,
    );
  }

}