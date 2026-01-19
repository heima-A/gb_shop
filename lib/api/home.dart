//封装一个api 目的是返回业务侧要的数据结构
import 'package:gb_shop/contants/index.dart';
import 'package:gb_shop/utils/DioRequest.dart';
import 'package:gb_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerList()async{
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
  return BannerItem.fromJson(item as Map<String,dynamic>);
 }).toList();
}