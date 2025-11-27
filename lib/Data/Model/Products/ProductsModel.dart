import 'package:hungery/Domian/Entities/Products/ProductsEntity.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel({super.code, super.message, super.data});

  ProductsModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
}

class Data extends ProductDataEntity {
  Data({
    super.id,
    super.name,
    super.description,
    super.image,
    super.rating,
    super.price,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    rating = json['rating'];
    price = json['price'];
  }
}
