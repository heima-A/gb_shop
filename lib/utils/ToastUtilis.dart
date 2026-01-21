import 'package:flutter/material.dart';

class ToastUtilis{
    static void shouToast(BuildContext content,String? msg){
       ScaffoldMessenger.of(content).showSnackBar(
      SnackBar(
        //设置圆角
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        //设置刷新成功信息停留时间
        duration: Duration(seconds: 2),
        width: 120,
        //设置刷新成功消息框处于悬浮状态
        behavior: SnackBarBehavior.floating,
        content: Text(msg ?? "刷新成功",textAlign: TextAlign.center,),
      ));
    }
  }
