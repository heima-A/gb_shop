import 'package:flutter/material.dart';
import 'package:gb_shop/api/home.dart';
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
    //定义一个列表来存储特惠推荐的数据
  SpecialOfferResult _specialRecommendResult = SpecialOfferResult(
    id: "",
    title: "",
    subTypes: [],
  );
  //定义一个列表来存储分类的数据
  List<CategoryItem> _categoryList = [];
  //定义一个列表来存储轮播图的数据
    List<BannerItem> _bannerList = [
    // BannerItem(
    //   id: "1", 
    // imageUrl: "lib/assets/aly1.png"
    // ),
    //  BannerItem(
    //   id: "2", 
    // imageUrl: "lib/assets/4.png"
    // ),
    //  BannerItem(
    //   id: "3", 
    //   imageUrl: "lib/assets/aly2.png"
    // ),
    
  ];
  List<Widget> _getScrollChliderr (){
      return [
        //包裹普通widget的sliver家族的组件
        SliverToBoxAdapter(child: Gbslider(bannerList: _bannerList)),
        //放置间隔组件
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        //防止分类组件
        SliverToBoxAdapter(child:Gbcatefory(categoryList: _categoryList)),
        
         //放置间隔组件
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        //放置推荐组件
        SliverToBoxAdapter(child: Gbsuggestion(specialOfferResult: _specialRecommendResult)),
        //放置间隔组件
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        //放置爆款组件
        SliverToBoxAdapter(
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:  Flex(
            direction: Axis.horizontal,
            children: [
                Expanded(
                child: Gbhot(result: _inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Gbhot(result: _oneStopResult, type: "step"),
              ),

              ]
              )
              ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      Gbmorelist(recommendList: _recommendList),
      ];
  }
  // 热榜推荐
  SpecialOfferResult _inVogueResult = SpecialOfferResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐
  SpecialOfferResult _oneStopResult = SpecialOfferResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 推荐列表
  List<GoodDetailItem> _recommendList = [];

int _page = 1;
bool isLoading = false; //当前正在加载
bool _hasMore = true; //是否还有下一页
  // 获取推荐列表
  void _getRecommendList() async {
    //当前已经有请求 或者 没有下一页 跳过请求
    if(isLoading || !_hasMore){
      return;
    }
    isLoading = true;
    int requestLimit = _page * 8;
    _recommendList = await getRecommendListAPI({"limit":requestLimit});
    isLoading = false;
    setState(() {});
    //判断是否还有下一页
    if(_recommendList.length < requestLimit){
      //如果没有更多数据了 则设置为false
      _hasMore = false;
      return;
    }
    //如果还有更多数据 则增加页码
    _page++;
  }


// 获取热榜推荐列表
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }


  @override
  void initState() { 
    super.initState();
    _getBannderList(); 
    _getCategoryList();
    _getProductList();
    _getInVogueList();
    _getOneStopList();
    _getRecommendList();
    _registerEvent();
  }
  //监听滚动到底部的事件
  void _registerEvent(){
    _scrollController.addListener((){
      //_scrollController.position.pixels  滚动距离 _scrollController.position.maxScrollExtent最大距离
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent -50){
        _getRecommendList();
      }
    });

  }
  //获取特惠推荐列表
  void _getProductList() async{
  _specialRecommendResult = await getProducListAPI();
    setState(() {});
  }
  //获取分类列表
  void _getCategoryList() async{
    _categoryList = await getCategoryList();
    setState(() {});
  }
  //获取轮播图列表
  void _getBannderList() async{
    _bannerList = await getBannerList();
    setState(() {});
  }
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,

        slivers: _getScrollChliderr(),
      );
  }
}