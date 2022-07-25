
import 'package:shop_app/modules/login/login_states.dart';

class categoriesModel
{
   bool? status;
   categoriesData? data;

  categoriesModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = categoriesData.fromJson(json['data']);
  }

}

class categoriesData {

    int ? currentPage;
    List<Data>? data=[];

  categoriesData.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    //data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    json['data'].forEach((e){
       data?.add(Data.fromJson(e));
    });
  }

}

class Data {
   int? id;
   String? name;
   String? image;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

}