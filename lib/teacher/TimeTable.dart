import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TimeTable extends StatefulWidget{
  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
        title: Text('TimeTable'),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(width: 100,height:30,),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Text('1'),
              ),
              SizedBox(width: 20,),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Text('2'),
              ),
              SizedBox(width: 20,),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Text('3'),
              ),
              SizedBox(width: 20,),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Text('4'),
              ),
              SizedBox(width: 20,),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Text('5'),
              ),
              SizedBox(width: 20,),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Text('6'),
              ),
              SizedBox(width: 20,),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Text('7'),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(width: 10,),
              Card(color: Colors.lightGreen[300],
                child: Container(child: Center(child: Text('Monday')),),),
              SizedBox(width: 7,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Maths')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('English')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Science')),),),
              SizedBox(width: 20,),
              Card(color: Colors.cyan[100],

                child: Container(child: Center(child: Text('EVS')),),),
              SizedBox(width:5,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Malayalam')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Hindi')),),),
              SizedBox(width: 20,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('IT')),),),

            ],
          ),
          Row(
            children: [
              Card(color: Colors.lightGreen[300],
                child: Container(child: Center(child: Text('Tuesday')),),),
              SizedBox(width: 7,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('English')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Maths')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Science')),),),
              SizedBox(width: 20,),
              Card(color: Colors.cyan[100],

                child: Container(child: Center(child: Text('EVS')),),),
              SizedBox(width:5,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Malayalam')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('IT')),),),
              SizedBox(width: 20,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Hindi')),),),

            ],
          ),
          Row(
            children: [
              Card(color: Colors.lightGreen[300],
                child: Container(child: Center(child: Text('Wednesday')),),),
              SizedBox(width: 7,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Maths')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('English')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Science')),),),
              SizedBox(width: 20,),
              Card(color: Colors.cyan[100],

                child: Container(child: Center(child: Text('EVS')),),),
              SizedBox(width:5,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Malayalam')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Hindi')),),),
              SizedBox(width: 20,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('IT')),),),

            ],
          ),
          Row(
            children: [
              Card(color: Colors.lightGreen[300],
                child: Container(child: Center(child: Text('Thurseday')),),),
              SizedBox(width: 7,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Maths')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('English')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Science')),),),
              SizedBox(width: 20,),
              Card(color: Colors.cyan[100],

                child: Container(child: Center(child: Text('EVS')),),),
              SizedBox(width:5,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Malayalam')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Hindi')),),),
              SizedBox(width: 20,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('IT')),),),

            ],
          ),
          Row(
            children: [
              Card(color: Colors.lightGreen[300],
                child: Container(child: Center(child: Text('Friday')),),),
              SizedBox(width: 7,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Maths')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('English')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Science')),),),
              SizedBox(width: 20,),
              Card(color: Colors.cyan[100],

                child: Container(child: Center(child: Text('EVS')),),),
              SizedBox(width:5,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Malayalam')),),),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('Hindi')),),),
              SizedBox(width: 20,),
              Card(color: Colors.cyan[100],
                child: Container(child: Center(child: Text('IT')),),),

            ],
          )
        ],
      ),
    );
  }
}