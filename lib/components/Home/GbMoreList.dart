import 'package:flutter/material.dart';

class Gbmorelist extends StatefulWidget {
  Gbmorelist({Key? key}) : super(key: key);

  @override
  _GbmorelistState createState() => _GbmorelistState();
}

class _GbmorelistState extends State<Gbmorelist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //主轴方向的间距
        mainAxisSpacing: 10,
        //交叉轴方向的间距
        crossAxisSpacing: 10,
        //每个网格的宽度
        crossAxisCount: 2,
        ), 
      itemBuilder: (BuildContext context,int index){
        return Container(
          color: Colors.blue,
          child: Text('商品',style: TextStyle(fontSize: 20,color: Colors.white)),
          alignment: Alignment.center,
        );
      });
  }
}