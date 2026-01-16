import 'package:flutter/material.dart';

class Gbhot extends StatefulWidget {
  Gbhot({Key? key}) : super(key: key);

  @override
  _GbhotState createState() => _GbhotState();
}

class _GbhotState extends State<Gbhot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      alignment: Alignment.center,
      color: Colors.blue,
       child: Text('爆款推荐',style: TextStyle(fontSize: 20,color: Colors.white),),
    );
  }
}