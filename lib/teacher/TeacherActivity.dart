import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherActivity extends StatelessWidget{
  final Icon icn;
  final String txt;
  final Color clr;

  const TeacherActivity({
    Key?key,
    required this.icn,
    required this.txt,
    required this.clr,

  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap:(){},

            child: Container(
                height: 40,width: 40,
                color:clr,
                child:icn
            ),
          ),
        ),
        Text(txt),
      ],
    );
  }

}