

class categoriesDetailsModel {
  bool? status;
  dynamic? message;
  categoriesDetailsData? data;


  categoriesDetailsModel.fromJson(Map<String, dynamic> json) {
    this.status = json["status"];
    this.message = json["message"];
    this.data = json["data"] == null ? null : categoriesDetailsData.fromJson(json["data"]);
  }

}

class categoriesDetailsData {
  int? currentPage;
  List<categData>? data;
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


  categoriesDetailsData.fromJson(Map<String, dynamic> json) {
    this.currentPage = json["current_page"];
    this.data = json["data"]==null ? null : (json["data"] as List).map((e)=>categData.fromJson(e)).toList();
    this.firstPageUrl = json["first_page_url"];
    this.from = json["from"];
    this.lastPage = json["last_page"];
    this.lastPageUrl = json["last_page_url"];
    this.nextPageUrl = json["next_page_url"];
    this.path = json["path"];
    this.perPage = json["per_page"];
    this.prevPageUrl = json["prev_page_url"];
    this.to = json["to"];
    this.total = json["total"];
  }

}

class categData {
  int? id;
  dynamic? price;
  dynamic? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;


  categData.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.price = json["price"];
    this.oldPrice = json["old_price"];
    this.discount = json["discount"];
    this.image = json["image"];
    this.name = json["name"];
    this.description = json["description"];
    this.images = json["images"]==null ? null : List<String>.from(json["images"]);
    this.inFavorites = json["in_favorites"];
    this.inCart = json["in_cart"];
  }

}