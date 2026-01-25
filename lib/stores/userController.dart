import 'package:gb_shop/viewmodels/login.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
      var user = UserInfo.fromJSON({}).obs; //user对象被监听了
      updateUserInfo(UserInfo newUser){
        user.value = newUser;
      }
}