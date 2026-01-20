class GlobalConstants {
  // 静态常量 static 可以直接用GlobalConstants.BASE_URL来使用常量
  static const String BASE_URL = 'https://meikou-api.itheima.net'; //基础地址
  static const int TIME_OUT = 10; //超时时间10秒
  static const String SUCCESS_CODE = '1'; //成功状态

}
//存放请求地址接口的常量
class HttpConstants {
  static const String BANNER_LIST = '/home/banner'; //轮播图接口
  static const String CATEGORY_LIST = '/home/category/head'; //分类接口
  static const String PRODUCT_LIST = '/hot/preference'; //特惠推荐地址
}
