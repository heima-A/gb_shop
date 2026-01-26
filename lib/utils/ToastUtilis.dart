import 'package:flutter/material.dart';
//这段代码是一个自定义的 Toast工具类（实际使用的是 Flutter 的 SnackBar），主要作用是显示一个防抖动的消息提示。
class ToastUtilis{
    static bool showLoading = false;
    static void showToast(BuildContext context,String? msg){
      if(ToastUtilis.showLoading){
        return;
      }
      ToastUtilis.showLoading = true;
      //这段代码的作用是延迟3秒后将 showLoading 标志重置为 false。
      Future.delayed(Duration(seconds: 3),(){
        ToastUtilis.showLoading = false;
      });
      //作用：获取当前页面（context 所在的 Scaffold）对应的 ScaffoldMessenger
      //它负责 在页面上显示 SnackBar 消息ScaffoldMessenger.of(context)
       ScaffoldMessenger.of(context).showSnackBar(
        //页面底部弹出一个短暂提示条
        //可以显示操作成功、错误信息、警告等
      SnackBar(
        //设置圆角
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        //设置刷新成功信息停留时间
        duration: Duration(seconds: 2),
        width: 180,
        //设置刷新成功消息框处于悬浮状态
        behavior: SnackBarBehavior.floating,
        content: Text(msg ?? "刷新成功",textAlign: TextAlign.center,),
      ));
    }
  }
