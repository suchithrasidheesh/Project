import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: HomeWork(),
  debugShowCheckedModeBanner: false,
  ));
}



class HomeWork extends StatelessWidget{
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
                title: Text('English'),
                subtitle: Text('Chapter 2 Summary'),
              ),
            ),
            Divider(thickness:1,color: Colors.grey,)
          ],
        );
      },itemCount: 6,),
    );
  }

}