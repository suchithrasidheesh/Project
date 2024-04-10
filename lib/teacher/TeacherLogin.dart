import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/SelectRoleScreen.dart';
import 'package:project/teacher/TeacherNavigation.dart';
import 'package:project/teacher/TreacherRegistration.dart';


import '../Helper/TeacherHelper.dart';



class TeacherLogin extends StatefulWidget{
  @override
  State<TeacherLogin> createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
  var size,ht,wt;
  final tea_email_Cntrol=TextEditingController();
  final tea_pass_cntrol=TextEditingController();


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
          ),
          Positioned(height:ht/3,width: wt,
              child: ClipRRect(borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100,),bottomRight: Radius.circular(100)),
                  child: Container(
                    child:Image(image: AssetImage('assets/images/school.png'),fit: BoxFit.cover,),
                  ))),
          Positioned(top: 250,
            child: Container(height: ht,width:wt,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white70),
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Text('Login',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height:20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right:25),
                    child: TextField(
                      controller:tea_email_Cntrol,
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
                      controller:tea_pass_cntrol,
                      decoration: InputDecoration(
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'Password',
                          suffixIcon:Icon(Icons.visibility_off_sharp)
                      ),),
                  ),
                  // SizedBox(height: 10,),
                  // TextButton(onPressed: (){
                  //   Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>ForgotPassword()));
                  //  }, child:Text('Forgot password?'))
                  Padding(
                    padding: const EdgeInsets.only(top:50,),
                    child: Center(
                      child: ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:Colors.blue),
                          onPressed:(){
                            TeacherHelper()
                                .login(email:tea_email_Cntrol.text,pwd:tea_pass_cntrol.text)
                                .then((result){
                              if(result==null){
                                tea_email_Cntrol.clear();
                                tea_pass_cntrol.clear();
                                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>TeacherNavigation()));
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text((result)),
                                  backgroundColor: Colors.blue, ));
                              }
                            });
                          } , child:Text('LogIn',style:TextStyle(color: Colors.white),)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 50),
                    child: Row(
                      children: [
                        Text("Don't you have an account?"),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>teacherRegistration()));
                        }, child:Text('SignUp Here')),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 50),
                    child:
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>SelectLogin()));
                         }, child:Text('Back')),
                  )
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
