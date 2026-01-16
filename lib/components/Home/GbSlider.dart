import 'package:flutter/material.dart';

class Gbslider extends StatefulWidget {
  Gbslider({Key? key}) : super(key: key);

  @override
  _GbsliderState createState() => _GbsliderState();
}

class _GbsliderState extends State<Gbslider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 300,
      color: Colors.blue,
       child: Text('轮播图',style: TextStyle(fontSize: 20,color: Colors.white),),
    );
  }
}