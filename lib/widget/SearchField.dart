import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchfield extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            prefixIcon:Icon(Icons.search),
            hintText: 'search anything....'
        ),
      ),
    );
  }

}