

class changeFavoritesModel
{
  String ? message;
  bool ? status;

  changeFavoritesModel.fromJson(Map<String,dynamic> json)
  {
    message =json['message'];
    status=json['status'];
  }

}


/*
class Example {
  bool? status;
  String? message;
  Data? data;

  Example({this.status, this.message, this.data});

  Example.fromJson(Map<String, dynamic> json) {
    this.status = json["status"];
    this.message = json["message"];
    this.data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["message"] = this.message;
    if(this.data != null)
      data["data"] = this.data?.toJson();
    return data;
  }
}

class Data {
  int? id;
  Product? product;

  Data({this.id, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.product = json["product"] == null ? null : Product.fromJson(json["product"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    if(this.product != null)
      data["product"] = this.product?.toJson();
    return data;
  }
}

class Product {
  int? id;
  double? price;
  double? oldPrice;
  int? discount;
  String? image;

  Product({this.id, this.price, this.oldPrice, this.discount, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.price = json["price"];
    this.oldPrice = json["old_price"];
    this.discount = json["discount"];
    this.image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["price"] = this.price;
    data["old_price"] = this.oldPrice;
    data["discount"] = this.discount;
    data["image"] = this.image;
    return data;
  }
}

*/