import 'package:flutter/material.dart';

class Gbcatefory extends StatefulWidget {
  Gbcatefory({Key? key}) : super(key: key);

  @override
  _GbcateforyState createState() => _GbcateforyState();
}

class _GbcateforyState extends State<Gbcatefory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        //horizontal 水平方向
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext centext,int index){
          return Container(
            //设置宽度
            width: 80,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text('分类${index+1}',style: TextStyle(fontSize: 20,color: Colors.white)),
          );
         
        },
        ),
    );
  }
}