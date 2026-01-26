import 'package:gb_shop/contants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  //返回持久化对象得实例对象
  Future<SharedPreferences> _getInstance(){
   return SharedPreferences.getInstance();
  }
  //初始化token
  //内存缓存
  //_token = 当前 App 运行时的 token 快照
  String _token = '';
  Future<void> init() async{
    //拿到磁盘里的 SharedPreferences 实例
    final prefs = await _getInstance();
    //从磁盘读 token,如果磁盘里没有 token（第一次安装 / 已退出）
    //就用空字符串兜底,同步到内存
    _token = prefs.getString(GlobalConstants.TOKEN_KEY) ?? '';
  }
  //设置token
  //异步方法：因为要写磁盘
 Future<void> setToken(String val) async{
    //1.获取持久化实例
   final prefs = await _getInstance(); 
   //2.设置token
   //把 token 写入磁盘setString(GlobalConstants.TOKEN_KEY, val)
   //这一步保证：
   //App 被杀掉
    //下次打开还能登录
   prefs.setString(GlobalConstants.TOKEN_KEY, val); //token写入磁盘
   _token = val;
  }
  //获取token
  //获取 token（给请求用）
  String getToken(){
    return _token;
  }
  //移除token
  //移除 token（退出登录）
  Future<void> removeToken()async{
    final prefs = await _getInstance();
    //从磁盘删除 token
    prefs.remove(GlobalConstants.TOKEN_KEY);
    //清空内存
    _token = '';
  }
}
//创建 全局唯一实例
final tokenManager = TokenManager();