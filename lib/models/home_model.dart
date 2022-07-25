
class homeModel
{
  late bool status;
  late dataModel data;

  homeModel({
    required this.status,
    required this.data,
  });


  homeModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    data=dataModel.fromJson( json['data']);
  }

}

class dataModel
{
  late  List<banners> banner=[];
  late  List<products> product=[];

  dataModel({
    required this.banner,
    required this.product,
  });

  dataModel.fromJson(Map<String,dynamic> json)
  {
    json['banners'].forEach((e){
      banner.add(banners.fromJson(e));
    });

    json['products'].forEach((e){
      product.add(products.fromJson(e));
    });
  }

}


class banners
{
  late  int id;
  late  String image;

  banners({
    required this.id,
    required this.image,
  });

  banners.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    image = json['image'];
  }

}

class products
{

  late  int id;
  late  dynamic price;
  late  dynamic oldPrice;
  late  dynamic discount;
  late  String image;
  late  String name;
  late  bool inFavorites;
  late  bool inCart;
   late  String description;
   late  List<String> images;

  products({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.inFavorites,
    required this.inCart,
    required this.description,
    required this.images,
  });

  products.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
     description = json['description'];
    images = List.castFrom<dynamic, String>(json['images']);
  }

}









/*


class AutoGenerate {


  late final bool status;
  late final Null message;
  late final Data data;

  AutoGenerate({
    required this.status,
    this.message,
    required this.data,
  });

  AutoGenerate.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = null;
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}
*/

/*
class Data {

  late final List<Banners> banners;
  late final List<Products> products;
  late final String ad;

  Data({
    required this.banners,
    required this.products,
    required this.ad,
  });


  Data.fromJson(Map<String, dynamic> json){
    banners = List.from(json['banners'])
        .map(
            (e)=>Banners.fromJson(e)
    ).toList();
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
    ad = json['ad'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['banners'] = banners.map((e)=>e.toJson()).toList();
    _data['products'] = products.map((e)=>e.toJson()).toList();
    _data['ad'] = ad;
    return _data;
  }
}
*/

/*
class Banners {
  Banners({
    required this.id,
    required this.image,
    this.category,
    this.product,
  });
  late final int id;
  late final String image;
  late final Null category;
  late final Null product;

  Banners.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    category = null;
    product = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['category'] = category;
    _data['product'] = product;
    return _data;
  }
}

*/
class Products {
  Products({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });
  late final int id;
  late final int? price;
  late final int? oldPrice;
  late final int discount;
  late final String image;
  late final String name;
  late final String description;
  late final List<String> images;
  late final bool inFavorites;
  late final bool inCart;

  Products.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = List.castFrom<dynamic, String>(json['images']);
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['price'] = price;
    _data['old_price'] = oldPrice;
    _data['discount'] = discount;
    _data['image'] = image;
    _data['name'] = name;
    _data['description'] = description;
    _data['images'] = images;
    _data['in_favorites'] = inFavorites;
    _data['in_cart'] = inCart;
    return _data;
  }
}




