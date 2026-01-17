import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gb_shop/viewmodels/home.dart';

class Gbslider extends StatefulWidget {
  final List<BannerItem> bannerList;
  Gbslider({Key? key,required this.bannerList}) : super(key: key);

  @override
  _GbsliderState createState() => _GbsliderState();
}

class _GbsliderState extends State<Gbslider> {
  CarouselSliderController _controller = CarouselSliderController(); //控制轮播图跳转的控制器
  int _currentIndex = 0; //当前轮播图的索引
    Widget _getSlider(){
    //在Flutter中获取屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    //返回轮播图插件
    return CarouselSlider(
      //切换事件 需要先定义一个carouseController对象然后绑定给他完成绑定事件
      carouselController: _controller,
      items: List.generate(widget.bannerList.length, (int index){
      // 如果是网络图片 需要使用Image.Network
      return Image.asset(
      widget.bannerList[index].imageUrl!,
      fit: BoxFit.cover,
      width: screenWidth,
      );
    }), options: CarouselOptions(
      //切换事件
      onPageChanged: (int index, reason){
        _currentIndex = index;
        setState(() {
          
        });
      } ,
      height: 400,
      //设置轮播图的宽度为屏幕比例
      viewportFraction: 1.0,
      //自动播放
      autoPlay: true,
      //设置自动播放的间隔
      autoPlayInterval: Duration(seconds: 2),
    ));
  }
  //搜索框设置
  Widget _getSearch(){
    return  Positioned(
      top: 10,
      left: 0,
      right: 0,
      child:Padding(
        //设置搜索框整个页面的边距
      padding: EdgeInsets.all(10),
      child: Container(
        //设置搜索框内边距
      padding: EdgeInsets.symmetric(horizontal: 40),
      height: 50,
      alignment: Alignment.centerLeft,
      //设置搜索框底部颜色
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 0, 0, 0.3),
        //设置圆角
        borderRadius: BorderRadius.circular(25)
      ),
      child: Text(
        '搜索...',
        style: TextStyle(fontSize: 16,color: Colors.white),
      ),
    )));
    
   
  }
  Widget _getDots(){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      //SizeBox不用设背景颜色
      child: SizedBox(
        height: 40,
        width: double.infinity, //设置宽度无穷大
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, //主轴居中
          children: List.generate(widget.bannerList.length, (int index){
            return GestureDetector(
              onTap: () {
                _controller.jumpToPage(index);
              },
              //AnimatedContainer底部滚轮滑动组件
              child: AnimatedContainer(
                //控制底部滚轮动画时间
              duration: Duration(microseconds: 300),
              height: 6,
              width: index == _currentIndex ? 40 : 20,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: index == _currentIndex ?
                 Colors.white : 
                 //设置黑色的透明色
                 Color.fromRGBO(0, 0, 0, 0.3),
                 //设置圆角
                borderRadius: BorderRadius.circular(3),
              ),
            ));
            
          }),
        ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    //Stack -> 轮播图 搜索框 指示灯导航
    return Stack(
      children: [
        _getSlider(),
        _getSearch(),
        _getDots()
      ],
    );
    // return Container(
    //   alignment: Alignment.center,
    //   height: 300,
    //   color: Colors.blue,
    //    child: Text('轮播图',style: TextStyle(fontSize: 20,color: Colors.white),),
    // );
  }
}