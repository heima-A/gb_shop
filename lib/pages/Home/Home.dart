import 'package:flutter/material.dart';
import 'package:gb_shop/components/Home/GbCatefory.dart';
import 'package:gb_shop/components/Home/GbHot.dart';
import 'package:gb_shop/components/Home/GbMoreList.dart';
import 'package:gb_shop/components/Home/GbSlider.dart';
import 'package:gb_shop/components/Home/GbSuggestion.dart';
import 'package:gb_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //定义一个列表来存储轮播图的数据
  final List<BannerItem> _bannerList = [
    BannerItem(
      id: "1", 
    imageUrl: "lib/assets/aly1.png"
    ),
     BannerItem(
      id: "2", 
    imageUrl: "lib/assets/4.png"
    ),
     BannerItem(
      id: "3", 
      imageUrl: "lib/assets/aly2.png"
    ),
    
  ];
  List<Widget> _getScrollChliderr (){
      return [
        //包裹普通widget的sliver家族的组件
        SliverToBoxAdapter(child: Gbslider(bannerList: _bannerList)),
        //放置间隔组件
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        //防止分类组件
        SliverToBoxAdapter(child:Gbcatefory()),
        
         //放置间隔组件
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        //放置推荐组件
        SliverToBoxAdapter(child: Gbsuggestion()),
        //放置间隔组件
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        //放置爆款组件
        SliverToBoxAdapter(
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:  Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Gbhot()),
              SizedBox(width: 10),
              Expanded(child: Gbhot())
              ])),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      Gbmorelist(),
      ];
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomScrollView(
        slivers: _getScrollChliderr(),
      ),
    );
  }
}