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
