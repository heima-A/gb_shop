import 'package:flutter/material.dart';
import 'package:gb_shop/viewmodels/home.dart';

class Gbmorelist extends StatefulWidget {
  final List<GoodDetailItem> recommendList;
  Gbmorelist({Key? key,required this.recommendList}) : super(key: key);

  @override
  _GbmorelistState createState() => _GbmorelistState();
}

class _GbmorelistState extends State<Gbmorelist> {
   Widget _getChildren(int index) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            //宽高比组件
            child: AspectRatio(
              //设置宽高比
              aspectRatio: 1.0,
              child: Image.network(
                widget.recommendList[index].picture ?? "",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "lib/assets/home_cmd_inner.png",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.recommendList[index].name ?? "",
              //商品标题最多显示两行
              maxLines: 2,
              //商品标题超出部分省略号显示
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            //"左右两边各留10像素的内边距，上下不留边距"
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //这是一个构造函数，专门用于显示"丰富文本"
                Text.rich(
                  //Text不能直接放TextSpan，必须用Text.rich
                  TextSpan(
                    text: "¥${widget.recommendList[index].price}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: "${widget.recommendList[index].price}",
                        style: TextStyle(
                          //在文字中间画一条横线，表示"删除"或"原价"
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${widget.recommendList[index].payCount}人付款",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.recommendList.length,
      gridDelegate:
          // 网格是两列
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: _getChildren(index),
        );
      },
    );
  }
}
