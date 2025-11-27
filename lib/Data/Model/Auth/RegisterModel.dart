import 'package:hungery/Domian/Entities/Auth/RegisterEntity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({super.code, super.message, super.data});

  RegisterModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data extends DataEntity {
  Data({super.token, super.name, super.email, super.image});

  Data.fromJson(dynamic json) {
    token = json['token'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
  }
}
