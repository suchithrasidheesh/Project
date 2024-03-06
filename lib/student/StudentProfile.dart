import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class stuProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text('PROFILE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        actions: [
          Icon(Icons.notifications),
        ],),
      body: ListView(
        children: [
          CircleAvatar(backgroundImage: AssetImage('assets/images/Boy.png')),
          Center(child: Text('Robert')),
          Center(child: Text('7STD(ID:12345)')),
          SizedBox(height: 20,),
          ClipRRect(borderRadius: BorderRadius.circular(20),
            child: Container(color: Colors.grey[400],
              child: Column(
                children: [
                  ListTile(leading: Text('DateOfBirth'),trailing: Text('16-03-2016'),),
                  ListTile(leading: Text('FatherName'),trailing: Text('16-03-2016'),),
                  ListTile(leading: Text('Genter'),trailing: Text('16-03-2016'),),
                  ListTile(leading: Text('Class'),trailing: Text('16-03-2016'),),
                  ListTile(leading: Text('PhoneNumber'),trailing: Text('16-03-2016'),),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextButton(onPressed: (){}, child:Text('LogOut'))
        ],
      ),
    );
  }

}