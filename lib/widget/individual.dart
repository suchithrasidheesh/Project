import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/widget/SearchField.dart';

class individual extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var title=['Athira','Albin','Chinchu'];
    var sub=['8A','4B','10A'];
    return Scaffold(
      body: Column(
        children: [
          searchfield(),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index){
             return ListTile(
               leading: CircleAvatar(backgroundImage: AssetImage('assets/images/Boy.png'),radius: 20,),
               title: Text(title[index]),
               subtitle: Text(sub[index]),
               trailing: Icon(Icons.call),
             );
            },itemCount:title.length,),
          )
        ],
      ),
    );
  }

}