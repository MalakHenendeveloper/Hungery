class ProductsEntity {
  ProductsEntity({this.code, this.message, this.data});

  ProductsEntity.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDataEntity.fromJson(v));
      });
    }
  }

  num? code;
  String? message;
  List<ProductDataEntity>? data;
}

class ProductDataEntity {
  ProductDataEntity({
    this.id,
    this.name,
    this.description,
    this.image,
    this.rating,
    this.price,
  });

  ProductDataEntity.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    rating = json['rating'];
    price = json['price'];
  }

  num? id;
  String? name;
  String? description;
  String? image;
  String? rating;
  String? price;
}
