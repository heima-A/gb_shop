import 'package:flutter/material.dart';
import 'package:gb_shop/api/Mine.dart';
import 'package:gb_shop/components/Home/GbMoreList.dart';
import 'package:gb_shop/components/Home/Mine/index.dart';
import 'package:gb_shop/viewmodels/home.dart';

class MineView extends StatefulWidget {
  MineView({Key? key}) : super(key: key);

  @override
  _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        //LinearGradient（线性渐变）详解
        gradient: LinearGradient(
          begin: Alignment.topCenter, // 渐变起点：顶部中间
          end: Alignment.bottomCenter,// 渐变终点：底部中间
          colors: [const Color(0xFFFFF2E8), const Color(0xFFFDF6F1)],
        ),
      ),
      padding: const EdgeInsets.only(left: 20, right: 40, top: 80, bottom: 20),
      child: Row(
        children: [
           // 创建一个圆形头像组件CircleAvatar()
          CircleAvatar(
            radius: 26,// 圆的半径 = 26像素
            backgroundImage: const AssetImage('lib/assets/goods_avatar.png'),// 显示项目中的本地图片
            // 作用：
            // 1. 如果图片加载失败，显示白色背景
            // 2. 如果图片有透明部分，用白色填充
            // 3. 确保圆形效果明显
            backgroundColor: Colors.white,// 圆形背景色为白色
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              //让Column里所有子元素在水平方向上向左对齐 CrossAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '立即登录',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVipCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 197, 153),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Image.asset("lib/assets/ic_user_vip.png", width: 30, height: 30),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                '升级美荟商城会员，尊享无限免邮',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(128, 44, 26, 1),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              // 按钮样式TextButton.styleFrom
              style: TextButton.styleFrom(
                //背景颜色
                backgroundColor: const Color.fromRGBO(126, 43, 26, 1),
                //文字颜色
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                // 圆角矩形，圆角半径18像素
                // 效果：按钮变成圆角
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text('立即开通', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    Widget item(String pic, String label) {
      // 垂直排列图标+文字
      return Column(
        // Column高度根据内容决定
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(pic, width: 30, height: 30, fit: BoxFit.cover),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),// 左右外边距10像素
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),// 内边距
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        // 水平排列3个按钮
        child: Row(
          // 均匀分布，两端有空隙
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            item("lib/assets/ic_user_collect.png", '我的收藏'),
            item("lib/assets/ic_user_history.png", '我的足迹'),
            item("lib/assets/ic_user_service.png", '我的客服'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderModule() {
    //String pic图片地址集, String label 名称
    Widget orderItem(String pic, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min, // 紧凑布局
        children: [
          Image.asset(pic, width: 30, height: 30, fit: BoxFit.cover),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      );
    }
    //1. 外层布局
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        // 卡片阴影
        elevation: 2,
        //2. 卡片内部
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),

          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '我的订单',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  orderItem("lib/assets/ic_user_order.png", '全部订单'),
                  orderItem("lib/assets/ic_user_obligation.png", '待付款'),
                  orderItem("lib/assets/ic_user_unreceived.png", '待发货'),
                  orderItem("lib/assets/ic_user_unshipped.png", '待收货'),
                  orderItem("lib/assets/ic_user_unevaluated.png", '待评价'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
List<GoodDetailItem> _list = [];
ScrollController _Controller = ScrollController();
Map<String,dynamic> _params ={
  "page":1,
  "pageSize":10
};
@override
void initState() { 
  super.initState();
  _getGuessList();
  _registerEvent();
}
 void _registerEvent() {
  _Controller.addListener((){
      if(
    _Controller.position.pixels <= _Controller.position.maxScrollExtent - 50){
      _getGuessList();
    }
  });
  

 }
 //阀门控制
 bool _isLoading = false; //是否有人加载
 bool _harMore = true; //是否还有下一页
void _getGuessList() async{
  if(_isLoading || !_harMore){
    //有人正在加载或者没有下一页
    return;
  }
  _isLoading = true;
  final res =  await getGuessLikeAPI(_params);
  _isLoading = false;
  _list.addAll( res.items); //把内容追加到尾部
    setState(() {});
  if(_params["page"] >= res.pages){
    //没有下一页了
    _harMore = false;
    return;
  }
  _params["page"]++;//针对页面进行++ 
}
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _Controller,
      slivers: [
        SliverToBoxAdapter(child: _buildHeader()),
        SliverToBoxAdapter(child: _buildVipCard()),
        SliverToBoxAdapter(child: _buildQuickActions()),
        SliverToBoxAdapter(child: _buildOrderModule()),
        //吸顶组件猜你喜欢
        SliverPersistentHeader(delegate: GbGuess(),pinned: true),
        Gbmorelist(recommendList: _list),
      ],
    );
  }
}
