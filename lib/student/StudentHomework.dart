import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWork extends StatelessWidget{
    var title=['English','Maths','Science','Malayalam','SocialScience'];
    var subtitle=['Chapter2 Summary','Chapter1 Excersice','Chapter3 LabActivity','Chapter1 Reading','Write the PolutionCuases'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text('HOMEWORK',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
      body: ListView.builder(itemBuilder:(context,index){
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                tileColor: Colors.blueGrey,
                title: Text(title[index]),
                subtitle: Text(subtitle[index]),
              ),
            ),
            Divider(thickness:1,color: Colors.grey,)
          ],
        );
      },itemCount: title.length,),
    );
  }

}