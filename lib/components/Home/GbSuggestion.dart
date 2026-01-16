import 'package:flutter/material.dart';

class Gbsuggestion extends StatefulWidget {
  Gbsuggestion({Key? key}) : super(key: key);

  @override
  _GbsuggestionState createState() => _GbsuggestionState();
}

class _GbsuggestionState extends State<Gbsuggestion> {
  @override
  Widget build(BuildContext context) {
    return 
    Padding(padding: EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      alignment: Alignment.center,
      height: 300,
      color: Colors.blue,
       child: Text('推荐',style: TextStyle(fontSize: 20,color: Colors.white),),
    ));
  }
}