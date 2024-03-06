import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SelectRoleScreen.dart';

void main(){
  runApp(MaterialApp(
    home: Splash(),
    debugShowCheckedModeBanner: false,
  ));
}
class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var size,ht,wt;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    ht=size.height;
    wt=size.width;
    return Scaffold(
     body: Container(
      height: ht,width: wt,
       color: Colors.cyanAccent[100],
       child: Column(
        children: [
          SizedBox(height: 50,),
          Text('School Managment \n       Application',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Image(image: AssetImage('assets/images/cap.png'),height:300,width:300,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('  Experience e-school App design,where you can access,\nsecurely log in to access personalized school information,'
                '\nmanage fees,homework,exam and connect with school\ncommunity.',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>SelectLogin()));
           },style: ElevatedButton.styleFrom(backgroundColor:Colors.blue[300]), child:Text('GETSTARTED'))
        ],
      ),
    ),
    );
  }
}