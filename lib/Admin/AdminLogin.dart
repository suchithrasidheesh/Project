import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AdminHome.dart';
class AdminLogin extends StatefulWidget{
  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  var size,ht,wt;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    ht=size.height;
    wt=size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: ht,width: wt,
            color: Colors.greenAccent,
          ),
          Positioned(top: 100,
            child: Container(height: ht,width:wt,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white70),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text('Login',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  SizedBox(height:30),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right:25),
                    child: TextField(
                      decoration: InputDecoration(
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'UserName',
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right:25),
                    child: TextField(
                      decoration: InputDecoration(
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'Password',
                          suffixIcon:Icon(Icons.visibility_off_sharp)
                      ),),
                  ),
                ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150,),
            child: Center(
              child: ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:Colors.blue),
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>AdminHome()));
                  } , child:Text('LogIn',style:TextStyle(color: Colors.white),)),
            ),
          ),
        ],
      ),
    );
  }
}

