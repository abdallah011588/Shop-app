


class searchModel
{
  bool? status;
  dynamic? message;
  Data? data;

  searchModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }
}

class Data {
  int? currentPage;
  List<Product>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json["current_page"];
    data = json["data"]==null ? null : (json["data"] as List).map((e)=>Product.fromJson(e)).toList();
    firstPageUrl = json["first_page_url"];
    from = json["from"];
    lastPage = json["last_page"];
    lastPageUrl = json["last_page_url"];
    nextPageUrl = json["next_page_url"];
    path = json["path"];
    perPage = json["per_page"];
    prevPageUrl = json["prev_page_url"];
    to = json["to"];
    total = json["total"];
  }

}


class Product {
  int? id;
  dynamic? price;
  String? image;
  String? name;
  String? description;
  List<String>? images;


  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    image = json["image"];
    name = json["name"];
    description = json["description"];
    images = List.castFrom<dynamic, String>(json['images']);
  }

}



