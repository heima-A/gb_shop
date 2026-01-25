import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gb_shop/api/login.dart';
import 'package:gb_shop/stores/userController.dart';
import 'package:gb_shop/utils/ToastUtilis.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController(); // 账号控制器
  TextEditingController _codeController = TextEditingController(); // 密码控制器
  final UserController _userController = Get.find(); //寻找对象
  // 用户账号Widget
  Widget _buildPhoneTextField() {
    //专门用于表单输入的文本字段组件，
    //它在 TextField 的基础上增加了表单验证、保存等功能，通常与 Form 组件一起使用。
    //TextField - 基础文本输入
    // TextFormField - 表单专用文本输入
    return TextFormField(
      // 表单验证
      validator: (value) {
        if(value == null || value.isEmpty) {
          return '请输入账号';
        }
        //正则表达式验证账号是否为11位数字
        if(!RegExp(r"^1[3-9]\d{9}$").hasMatch(value)) {
          return '请输入正确的账号';
        }
        return null;
      },
      controller: _phoneController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20), // 内容内边距
        //提示文本hintText
        //作用
        // 在输入框为空时显示的灰色提示文本
        // 用户开始输入时自动消失
        // 用于指导用户输入什么内容
        hintText: "请输入账号",
        fillColor: const Color.fromRGBO(243, 243, 243, 1),
          //filled（填充背景）
          // 作用
          // 为输入框添加背景色
          // 需要配合 fillColor 使用
          // 通常用于创建有背景色的输入框
        filled: true, //启用填充
        //OutlineInputBorder 是 Flutter 
        //中用于定义带轮廓的输入框边框的类，
        //特别适合与 TextFormField 或 TextField 配合使用。
        border: OutlineInputBorder(
           // 关键：无边框线
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  // 用户密码Widget
  Widget _buildCodeTextField() {
    return TextFormField(
      validator: (value) {
        if(value == null || value.isEmpty) {
          return '请输入密码';
        }
         if(!RegExp(r"^[a-zA-Z0-9_]{6,16}$").hasMatch(value)) {
          return '请输入正确的密码';
        }
        return null;
      },
      controller: _codeController,
      //表示密文 不显示输入的密码
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20), // 内容内边距
        hintText: "请输入密码",
        fillColor: const Color.fromRGBO(243, 243, 243, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
 _login()async{
  //调用接口函数
  try{
   final res =  await loginAPI({
    "account":_phoneController.text,
    "password":_codeController.text
      });
      // print(res);//用户信息
      // 登录成功后，将用户信息保存到本地
      _userController.updateUserInfo(res);
      ToastUtilis.showToast(context,"登录成功");
      Navigator.pop(context);
  //走到这里此时一定登陆成功
  }catch (e){
      ToastUtilis.showToast(context, (e as DioException).message);
  }
 

 }
  // 登录按钮Widget
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // 登录逻辑
        if( _formKey.currentState!.validate()){
        if(_isChecked){
          _login();
          }else{
              ToastUtilis.showToast(context,'请勾选同意隐私条款和用户协议');
          }
        }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text("登录", style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }

  bool _isChecked = false;
  // 勾选Widget
  Widget _buildCheckbox() {
    return Row(
      children: [
        //Checkbox 是 Flutter 中用于多选的复选框组件。
        Checkbox(
          value: _isChecked,
          //勾选后的颜色
          activeColor: Colors.black,
          // 未勾选时的颜色
          checkColor: Colors.white,
          //onChanged 是 Flutter 中处理用户交互变化的核心回调函数，广泛用于各种表单组件。
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
          // 设置形状
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // 圆角大小
          ),
          // 可选：设置边框
          side: BorderSide(color: Colors.grey, width: 2.0),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "查看并同意"),
              TextSpan(
                text: "《隐私条款》",
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(text: "和"),
              TextSpan(
                text: "《用户协议》",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 头部Widget
  Widget _buildHeader() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "账号密码登录",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("惠多美登录", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      //在 Flutter 中，Form 组件是一个非常重要的表单容器组件，用于管理一组表单字段的验证、提交和重置。
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(30),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildHeader(),
              SizedBox(height: 30),
              _buildPhoneTextField(),
              SizedBox(height: 20),
              _buildCodeTextField(),
              SizedBox(height: 20),
              _buildCheckbox(),
              SizedBox(height: 20),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
