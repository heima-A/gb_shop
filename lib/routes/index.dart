import 'package:flutter/material.dart';
import 'package:gb_shop/pages/Login/index.dart';
import 'package:gb_shop/pages/Main/index.dart';

Widget getRootWidget(){
  return MaterialApp(
    initialRoute:'/' ,
    routes: getRootRoutes(),
  );
}
//路由配置
Map<String, Widget Function(BuildContext)> getRootRoutes(){
  return {
    '/': (context) => MainPage(),
    '/login': (context) => LoginPage(),
  };
}