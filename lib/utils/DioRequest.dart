import 'package:dio/dio.dart';
import 'package:gb_shop/contants/index.dart';

class Diorequest {
    final _dio = Dio(); //dio请求对象
    Diorequest(){
      _dio.options..baseUrl = GlobalConstants.BASE_URL //基础地址
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT) //连接超时时间
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT) //发送超时时间
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT); //接收超时时间
      //拦截器
      _addInterceptor();
    }
    void _addInterceptor(){
      _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (request,handle) {
          handle.next(request);
        },
        onResponse: (response, handler) {
          //http状态码 200 300  response.statusCode http状态码
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            // 处理成功响应
            handler.next(response);
            return;
          } 
          handler.reject(DioException(requestOptions: response.requestOptions));
          },
        
        onError: (error,handle) {
          // handle.reject(error);
          handle.reject(DioException(requestOptions: error.requestOptions,
          message: error.response?.data["msg"] ?? ""));
        },
      ),
      );
    }
    Future<dynamic> get(String url,{Map<String,dynamic>? params}){
    return _handleResponse(_dio.get(url,queryParameters: params));
  }
  Future<dynamic> post(String url,{Map<String,dynamic>? data}){
    return _handleResponse(_dio.post (url,data: data));
  }
  //进一步处理返回结果的数据
   Future<dynamic> _handleResponse(Future<Response<dynamic>> task)async{
    try{
      Response<dynamic> res =  await task;
      final data = res.data as Map<String,dynamic>;
      if (data['code']==GlobalConstants.SUCCESS_CODE){
        //如果http和业务状态码状态均正常，就可以正常的放行通过
        return data['result'];
      }
      //抛出异常
      throw DioException(requestOptions: res.requestOptions,
      message: data["msg"]??"加载数据失败");
    }catch(e){
      // throw Exception(e);
      rethrow; //不改变原来抛出的异常
    }
  }
}
final dioRequest = Diorequest();