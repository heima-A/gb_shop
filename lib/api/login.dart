//登录接口api
import 'package:gb_shop/contants/index.dart';
import 'package:gb_shop/utils/DioRequest.dart';
import 'package:gb_shop/viewmodels/login.dart';

Future<UserInfo> loginAPI(Map<String,dynamic> data)async{
  return UserInfo.fromJSON(await dioRequest.post(HttpConstants.LOGIN,data:data));
}
Future<UserInfo> getUserInfoAPI()async{
  return UserInfo.fromJSON(await dioRequest.get(HttpConstants.USER_PROFILE));
}
