import 'package:flutter/material.dart';
import 'package:gb_shop/viewmodels/home.dart';

class Gbsuggestion extends StatefulWidget {
  final SpecialOfferResult specialOfferResult;
  Gbsuggestion({Key? key,required this.specialOfferResult}) : super(key: key);

  @override
  _GbsuggestionState createState() => _GbsuggestionState();
}

class _GbsuggestionState extends State<Gbsuggestion> {
    List<SpecialOfferGoodsItem> _getDisplayItems(){
      //设置这个为了让首页显示时，不会因为没有子分类而报错
      if(widget.specialOfferResult.subTypes!.isEmpty){
        return [];
      }
      return widget.specialOfferResult.subTypes!.first.goodsItems!.items!.take(3).toList();
    }
  //特惠推荐和精选省攻略字体设置
  Widget _buildHeader(){
    return Row(
      children: [
        Text(
          '特惠推荐',
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(255, 82, 2, 2),
            fontWeight: FontWeight.w700
            ),
            ),
            SizedBox(width: 10,),
        Text('精选省攻略',style: TextStyle(
          fontSize: 12,
          color: const Color.fromARGB(255, 82, 2, 2),
          fontWeight: FontWeight.w700
        ),)
      ],
    );
  }
  //左侧年终大促设置
  Widget _buldLeft(){
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('lib/assets/home_cmd_inner.png'),
          fit: BoxFit.cover,
          )
      ),
    );
  }
  List<Widget> _getChliderenList(){
    List<SpecialOfferGoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (int index){
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
           errorBuilder: (context, error, stackTrace) {
              return Image.asset('lib/assets/home_cmd_inner.png',
              width: 100,
              height: 140,
              fit: BoxFit.cover,
              );
           },
            list[index].picture ?? "",
            width: 100,
            height: 140,
            fit: BoxFit.cover,
          ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text('￥${list[index].price}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,

            ),
            ),
            
          )
          
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      padding: EdgeInsets.all(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //ImageProvider 需要用AssetImage传递 不能用普通image
        image: DecorationImage(
          image: AssetImage('lib/assets/home_cmd_sm.png'),
          fit: BoxFit.cover,
          )
      ),
       child: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 10,),
          Row(
            children: [
              _buldLeft(),
              // Expanded组件占满剩余空间
              Expanded(
                child: Row(
                  //设置主轴均分！mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _getChliderenList(),
                ),
              )
            ],
          ),
        ],
       )
    ));
  }
}