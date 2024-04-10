
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../Helper/FirebaseHelper.dart';
import '../SelectRoleScreen.dart';
import 'RegistrationForm.dart';
import 'StudNavigationBar.dart';

class StudentLogin extends StatefulWidget{
  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {



  final stud_email_Cntrol=TextEditingController();
  final stud_pass_cntrol=TextEditingController();

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
          ),
          Positioned(height:ht/3,width: wt,
              child: ClipRRect(borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100,),bottomRight: Radius.circular(100)),
                  child: Container(
                    child: Image(image: AssetImage('assets/images/school.png'),fit: BoxFit.cover,),
                  ))),
          Positioned(top: 250,
            child: Container(height: ht,width:wt,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white70),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text('Login',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  SizedBox(height:30),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right:25),
                    child: TextField(
                      controller:stud_email_Cntrol,
                      decoration: InputDecoration(
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'UserName',
                        helperText: 'User name should be email address'
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right:25),
                    child: TextField(
                      controller:stud_pass_cntrol,
                      decoration: InputDecoration(
                          border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          hintText: 'Password',
                          suffixIcon:Icon(Icons.visibility_off_sharp)
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50,),
                    child: Center(
                      child: ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:Colors.blue),
                          onPressed:(){
                            FirebaseHelper()
                                .loginUser(email:stud_email_Cntrol.text,pwd:stud_pass_cntrol.text)
                                .then((result){
                              if(result==null){
                                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>StudNavigationBar()));
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text((result)),
                                  backgroundColor: Colors.blue, ));
                              }
                            });
                          } ,
                          child:Text('LogIn',style:TextStyle(color: Colors.white),)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(top: 40,left: 50),
                    child: Row(
                      children: [
                        Text("Don't have an account?"),
                        TextButton(onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>RegistrationForm()));
                        }, child:Text('SignUp Here')),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child:
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>SelectLogin()));
                      }, child:Text('Back')),
                  )
                  // SizedBox(height: 3,),
                  // TextButton(onPressed: (){
                  //   Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>ForgotPassword()));
                  //  }, child:Text('Forgot password?'))
                ],),
            ),
          ),

        ],
      ),
    );
  }
}


