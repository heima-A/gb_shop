import 'package:flutter/material.dart';
import 'package:gb_shop/pages/Cart/Cart.dart';
import 'package:gb_shop/pages/Category/Category.dart';
import 'package:gb_shop/pages/Home/Home.dart';
import 'package:gb_shop/pages/Mine/Mine.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String,String>> _routes = [
    {
    "icon": "lib/assets/ic_public_home_normal.png", //正常显示的图标
    "active_icon":"lib/assets/ic_public_home_active.png",//激活显示的图标
    "title": "首页",
  },
    {
    "icon": "lib/assets/ic_public_pro_normal.png", //正常显示的图标
    "active_icon":"lib/assets/ic_public_pro_active.png",//激活显示的图标
    "title": "分类",
  },
    {
    "icon": "lib/assets/ic_public_cart_normal.png", //正常显示的图标
    "active_icon":"lib/assets/ic_public_cart_active.png",//激活显示的图标
    "title": "购物车",
  },
    {
    "icon": "lib/assets/ic_public_my_normal.png", //正常显示的图标
    "active_icon":"lib/assets/ic_public_my_active.png",//激活显示的图标
    "title": "我的",
  },
  ];
  //设置默认索引
  int _currentIndex = 0;
  //定义变量来返回 底部函数items所需要的类型
  List<BottomNavigationBarItem> _getTabBarWidget(){
    //根据列表长度来生成底部导航栏的item
    return List.generate(_routes.length, (int index){
        return BottomNavigationBarItem(
          //图标
          icon: Image.asset(_routes[index]['icon']!,width: 30,height: 30,),
          //激活图标
          activeIcon: Image.asset(_routes[index]['active_icon']!,width: 30,height: 30,),
          //标题
          label: _routes[index]['title']!,
        );
    });
  }
  List<Widget> _getChildren () {
    return [
      HomeView(),
      CartView(),
      MineView(),
      CategoryView(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      //使用SafeArea 避开安全区组件
      SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getChildren(),
        )
        ),
      bottomNavigationBar: BottomNavigationBar(
        //展示没有选中的文本 设置为true
        showUnselectedLabels: true,
        //选中项的的颜色
        selectedItemColor: Colors.black,
        //非选中项的颜色
        unselectedItemColor: Colors.black,
        onTap: (int index) {
          //设置点击切换 把索引绑定给_currentIndex实现点击切换
          //并调用setState刷新UI
            _currentIndex = index;
            setState(() {});
        },
        //设置当前选中的索引作为第一个显示页
        currentIndex: _currentIndex,
        items: _getTabBarWidget()),
    );
  }
}