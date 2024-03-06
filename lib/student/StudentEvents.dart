import 'package:flutter/cupertino.dart';

class StudentsEvents extends StatelessWidget{
  final Image img;
  StudentsEvents({
   Key?key,
    required this.img
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(10),
      child: Container(
        height:100,width: 160,
        child: img,
      ),
    );
  }

}