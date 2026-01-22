import 'package:gb_shop/contants/index.dart';
import 'package:gb_shop/utils/DioRequest.dart';
import 'package:gb_shop/viewmodels/home.dart';

Future<SpecialOfferGoodsDtetaisItems> getGuessLikeAPI(Map<String,dynamic> params)async{
  return SpecialOfferGoodsDtetaisItems.fromJson(await dioRequest.get(HttpConstants.GUESS_LIST,params: params));
}