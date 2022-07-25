class loginModel
{
  late bool status;
  late dynamic message;
  late userData? data;

  loginModel({
    required this.status,
   required this.message,
   required this.data,
  });


  loginModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=json['data'] !=null? userData.fromJson(json['data']): null;
  }



}

class userData
{
  late  int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late dynamic points;
  late dynamic credit;
  late String token;

  userData(
  {
   required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  userData.fromJson(Map<String,dynamic> json)
  {
    id =json['id'];
    name =json['name'];
    email =json['email'];
    phone =json['phone'];
    image =json['image'];
    points =json['points'];
    credit =json['credit'];
    token =json['token'];
  }


}




































/*
class AutoGenerate {

  late final bool status;
  late final String message;
  late final Data data;

   AutoGenerate({
    required this.status,
    required this.message,
    required this.data,
  });

  AutoGenerate.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
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

class Data {

  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String image;
  late final int points;
  late final int credit;
  late final String token;


   Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });


  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['image'] = image;
    _data['points'] = points;
    _data['credit'] = credit;
    _data['token'] = token;
    return _data;
  }
}
 */