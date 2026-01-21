//封装一个api 目的是返回业务侧要的数据结构
import 'package:gb_shop/contants/index.dart';
import 'package:gb_shop/utils/DioRequest.dart';
import 'package:gb_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerList()async{
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
  return BannerItem.fromJson(item as Map<String,dynamic>);
 }).toList();
}
// 推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
          as List)
      .map((item) {
        return GoodDetailItem.formJSON(item as Map<String, dynamic>);
      })
      .toList();
}
//获取分类列表
Future<List<CategoryItem>> getCategoryList()async{
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((item){
  return CategoryItem.fromJson(item as Map<String,dynamic>);
 }).toList();
}

//获取特惠推荐列表
Future<SpecialOfferResult> getProducListAPI()async{
  return SpecialOfferResult.fromJson(
    await dioRequest.get(HttpConstants.PRODUCT_LIST));
}

// 热榜推荐
Future<SpecialOfferResult> getInVogueListAPI() async {
  // 返回请求
  return SpecialOfferResult.fromJson(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

// 一站式推荐
Future<SpecialOfferResult> getOneStopListAPI() async {
  // 返回请求
  return SpecialOfferResult.fromJson(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}