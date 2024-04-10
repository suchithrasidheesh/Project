import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/individual.dart';


class StudMessage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[200],
            title: Text('MESSAGES',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          bottom: TabBar(tabs: [
            Tab(text: 'Individual ',),
          ],),
        ),
      body: TabBarView(
        children: [
          individual(),

        ],
      ),

      ),
    );
  }

}