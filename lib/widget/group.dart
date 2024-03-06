import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/widget/SearchField.dart';

class group extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            searchfield(),
            Expanded(
              child: ListView.builder(itemBuilder: (context,index){
                return ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage('assets/images/Boy.png'),radius: 20,),
                  title: Text('Albert'),
                  subtitle: Text('7B'),
                  trailing: Icon(Icons.call),
                );
              },itemCount:3,),
            )
          ],
        ),
    );
  }

}