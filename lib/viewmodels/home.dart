class BannerItem{
  String ?id;
  String? imageUrl;
  BannerItem({required this.id,required this.imageUrl});
  //扩展一个工厂函数，一般用factory来声明，一般用来创建实例对象
  factory BannerItem.fromJson(Map<String,dynamic> json){
    return BannerItem(
      id: json['id'] ?? "",
      imageUrl: json['imgUrl'] ?? "",
    );
  }
}

class SpecialOfferResult{
  String ?id;
  String ?title;
  List<SpecialOfferSubType>? subTypes;
  SpecialOfferResult({
    required this.id,
    required this.title,
    required this.subTypes});
  factory SpecialOfferResult.fromJson(Map<String,dynamic> json){
    return SpecialOfferResult(
      id: json['id']?.toString() ?? "",
      title: json['title']?.toString() ?? "",
      subTypes: json['subTypes'] == null ? null : (json['subTypes'] as List).map((item){
        return SpecialOfferSubType.fromJson(item as Map<String,dynamic>);
      }).toList(),
    );
  }
}

class SpecialOfferSubType{
  String ?id;
  String ?title;
  SpecialOfferGoodsItems? goodsItems;
  SpecialOfferSubType({required this.id,required this.title,required this.goodsItems});
  factory SpecialOfferSubType.fromJson(Map<String,dynamic> json){
    return SpecialOfferSubType(
      id: json['id']?.toString() ?? "",
      title: json['title']?.toString() ?? "",
      goodsItems: json['goodsItems'] == null ? 
      null : SpecialOfferGoodsItems.fromJson(json['goodsItems'] as Map<String,dynamic>),
    );
  }
}

class SpecialOfferGoodsItems{
  int? counts;
  int? pageSize;
  int? pages;
  int? page;
  List<SpecialOfferGoodsItem>? items;
  SpecialOfferGoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items});
  factory SpecialOfferGoodsItems.fromJson(Map<String,dynamic> json){
    return SpecialOfferGoodsItems(
      counts: (json['counts'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      items: json['items'] == null ? null : (json['items'] as List).map((item){
        return SpecialOfferGoodsItem.fromJson(item as Map<String,dynamic>);
      }).toList(),
    );
  }
}

class SpecialOfferGoodsItem{
  String ?id;
  String ?name;
  String? desc;
  String? price;
  String? picture;
  int? orderNum;
  SpecialOfferGoodsItem({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.picture,
    required this.orderNum});
  factory SpecialOfferGoodsItem.fromJson(Map<String,dynamic> json){
    final dynamic order = json['orderNum'];
    return SpecialOfferGoodsItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      desc: json['desc']?.toString(),
      price: json['price']?.toString(),
      picture: json['picture']?.toString(),
      orderNum: order is int ? order : int.tryParse(order?.toString() ?? ""),
    );
  }
}

  //  {
  //     "id": "1181622001",
  //     "name": "气质女装",
  //     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png",
  //     "children": [
  //       {
  //         "id": "1191110001",
  //         "name": "半裙",
  //         "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bq.png?quality=95&imageView",
  //         "children": null,
  //         "goods": null
  //       },
  //       {
  //         "id": "1191110002",
  //         "name": "衬衫",
  //         "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_cs.png?quality=95&imageView",
  //         "children": null,
  //         "goods": null
  //       },
  //       {
  //         "id": "1191110022",
  //         "name": "T恤",
  //         "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_tx.png?quality=95&imageView",
  //         "children": null,
  //         "goods": null
  //       },
  //       {
  //         "id": "1191110023",
  //         "name": "针织衫",
  //         "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_zzs.png?quality=95&imageView",
  //         "children": null,
  //         "goods": null
  //       },
  //       {
  //         "id": "1191110024",
  //         "name": "夹克",
  //         "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_jk.png?quality=95&imageView",
  //         "children": null,
  //         "goods": null
  //       },
  //       {
  //         "id": "1191110025",
  //         "name": "卫衣",
  //         "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_wy.png?quality=95&imageView",
  //         "children": null,
  //         "goods": null
  //       },
  //       {
  //         "id": "1191110028",
  //         "name": "背心",
  //         "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bx.png?quality=95&imageView",
  //         "children": null,
  //         "goods": null
  //       }
  //     ],
// 根据json数据 定义一个分类模型类
class CategoryItem{
  String ?id;
  String? name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({required this.id,required this.name,required this.picture,required this.children});
  //扩展一个工厂函数，一般用factory来声明，一般用来创建实例对象
  factory CategoryItem.fromJson(Map<String,dynamic> json){
    return CategoryItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      picture: json['picture'] ?? "",
      children: json['children'] == null ? 
      null : (json['children'] as List).map((item){
        return CategoryItem.fromJson(item as Map<String,dynamic>);
      }).toList(),
    );
  }
}
