import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Verification.dart';

class RegistrationForm extends StatelessWidget{
  var size,ht,wt;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    ht=size.height;
    wt=size.width;
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: SizedBox(
        height: ht,
        child: Column(
          children: [
            SizedBox(height: 30,),
            Center(child: Text('Registration Form',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left:30,right: 40),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  labelText: 'Fullname'
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 40),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    labelText: 'Gender',
                    //suffixIcon:DropdownButton(items: items, onChanged: onChanged)
                ),
              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 40),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    labelText: 'Address'
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 40),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    labelText: 'Phonenumber'
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 40),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    labelText: 'E-mail'
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Verification()));
             }, child:Text('SignUp')),
            SizedBox(height: 10,),
            TextButton(onPressed: (){}, child:Text('You are a registered user LoginHere!!'))
          ],
        ),
      ),
    );
  }

}