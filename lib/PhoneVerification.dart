import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:project/student/StudentLogin.dart';

class Verification extends StatefulWidget{
  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final phne_cntrl=TextEditingController();
  final otp_cntrl=TextEditingController();
  String userNumber='';
  var otpFieldvissible=false;
  var receiveId='';

  FirebaseAuth auth=FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          IntlPhoneField(
            controller: phne_cntrl,
            initialCountryCode: 'NG',
            invalidNumberMessage: 'Enter valid mobile number',
            decoration: InputDecoration(border: OutlineInputBorder(),
            hintText: 'Phone number',
              labelText: 'Phone'
            ),
            onChanged: (val){
              userNumber=val.completeNumber;
            },
          ),
          Visibility(
            visible: otpFieldvissible,
              child: TextField(
            controller: otp_cntrl,
                decoration:InputDecoration(border: OutlineInputBorder(),
              hintText: 'OTP Code',
              labelText: 'OTP'
            ),
          )),
          ElevatedButton(
              onPressed:(){
                if(otpFieldvissible){
                  verifyOTp();
                }
                else{
                  verifyphonenumber();
                }
              },

              child: Text('Verify Phone number'))
        ],
      ),
    );
  }

  Future<void> verifyOTp()async {
    PhoneAuthCredential credential=PhoneAuthProvider.credential(
        verificationId: receiveId,
        smsCode:otp_cntrl.text
    );
    await auth.signInWithCredential(credential).then((value)async{
      if(value.user!=null){
        Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context)=>StudentLogin()));
      }
    });

  }

  void verifyphonenumber() {
    auth.verifyPhoneNumber(
      phoneNumber: userNumber,
        verificationCompleted:(PhoneAuthCredential credential)async{
          await auth.signInWithCredential(credential).then((value)async{
            if(value.user!=null){
              Navigator.pushReplacement(context,MaterialPageRoute(
                  builder: (context)=>StudentLogin()));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e){
        print(e.message);
        },
        codeSent: (String verificationId,int? resendToken){
        receiveId=verificationId;
        otpFieldvissible=true;
        setState(() {});
        },
        codeAutoRetrievalTimeout:(String verification){}
    );
  }


}