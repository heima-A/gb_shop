import 'package:flutter/material.dart';
import 'package:gb_shop/viewmodels/home.dart';

class Gbcatefory extends StatefulWidget {
  //定义一个列表来存储分类的数据
  final List<CategoryItem> categoryList;
  Gbcatefory({Key? key,required this.categoryList}) : super(key: key);

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
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext centext,int index){
          //从分类列表中获取数据
          final category = widget.categoryList[index];
          return Container(
            //设置宽度
            width: 80,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 232, 234),
              borderRadius: BorderRadius.circular(10),
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(category.picture,
                width: 40,height: 40),
                Text(
                  '${category.name}'
                  ,style: TextStyle(color: Colors.black)),
              ],
            ),
          );
         
        },
        ),
    );
  }
}