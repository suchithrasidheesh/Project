import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class HomeWork extends StatefulWidget{
  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {

  late CollectionReference homeWork,student;



    @override
  void initState() {
    homeWork=FirebaseFirestore.instance.collection('HomeWork');
    student=FirebaseFirestore.instance.collection('StudentsData');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('HOMEWORK',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
        body: StreamBuilder(
            stream: student.snapshots(),
            builder: (context,snapshot){
              if(snapshot.hasError){
                return Text('Error');
              }
              if(snapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              final data=snapshot.data!.docs;
              return ListView.builder(
                  itemBuilder: (context,index){
                    final stud=data[index];
                    final div=stud['Division'];
                    final cls=stud['Class'];
                    if(stud!=null){
                      Data(cls,div);
                    }else{
                      return Text('dada');
                    }

                  },itemCount: snapshot.data!.size,);
            })
    );
  }
   Data(String clss, String divi){
    StreamBuilder(
        stream: homeWork.snapshots(),
        builder:(context,snapshot){
          if(snapshot.hasError){
            return Text('Error');
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          final data=snapshot.data!.docs;

          return ListView.builder(itemBuilder:(context,index){
            final d1=data[index];
            final c=d1['Class'];
            final d=d1['Division'];
            print(c);
            if(clss==c&&divi==d){
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      tileColor: Colors.blueGrey,
                      title: Text(d1['Subject']),
                      subtitle: Text(d1['Work']),
                    ),
                  ),
                  Divider(thickness:1,color: Colors.grey,)
                ],
              );
            }else{
              print('data not match');
            }

            },itemCount: snapshot.data!.size,);
        });
    }

}