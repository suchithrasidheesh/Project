import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Helper/FirebaseHelper.dart';
import 'StudentLogin.dart';

class Profile extends StatefulWidget{
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late CollectionReference student;
  late final email;
  @override
  void initState() {
    student=FirebaseFirestore.instance.collection('StudentsData');
     email=FirebaseHelper().auth.currentUser?.email;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text('PROFILE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        actions: [
          Icon(Icons.notifications),
          SizedBox(width: 10,),
          InkWell(
            onTap: (){
              FirebaseHelper()
                  .logout()
                  .then((value) => Get.to(()=>StudentLogin()));
            },
              child: Icon(Icons.logout))
        ],),
      body:SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream:getUserData(),
            builder: (context,snapshot){
              if(snapshot.hasError){
                return Text('Error ${snapshot.error}');
              }
              if(snapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              final users=snapshot.data!.docs;
              return ListView.builder(
                itemBuilder:(context,index){
                  final user=users[index];
        
                  final user1=snapshot.data?.size;
                  print(user1);
                  final useremail=user['Email'];
                  print(user['Email']);
                  print(email);
                  if(useremail!=email){
                    return Text('');
                  }else{
                    return Column(
                      children: [
                        CircleAvatar(backgroundImage: AssetImage('assets/images/Boy.png')),
                        Center(child: Text(user['Name'])),
                        Center(child: Text('Admission No:${user['AdNo']}')),
                        SizedBox(height: 20,),
                        ClipRRect(borderRadius: BorderRadius.circular(20),
                          child: Container(color: Colors.cyan[100],
                            child: Column(
                              children: [
                                ListTile(leading: Text('FatherName'),trailing: Text(user['FatherName']),),
                                SizedBox(height: 10,),
                                ListTile(leading: Text('Class'),trailing: Text(user['Class']),),
                                SizedBox(height: 10,),
                                ListTile(leading: Text('Division'),trailing: Text(user['Division']),),
                                SizedBox(height: 10,),
                                ListTile(leading: Text('Email '),trailing: Text(user['Email']),),
                                SizedBox(height: 10,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        TextButton(onPressed: (){
                          FirebaseHelper()
                              .logout()
                              .then((value) => Get.to(()=>StudentLogin()));
                        },
                            child:Text('LogOut'))
                      ],
                    );

                  }
                },itemCount: snapshot.data?.size,
        
              );
            }),
      ),

    );
  }

  Stream<QuerySnapshot>getUserData(){
    return student.snapshots();
  }
}