import 'package:hungery/Domian/Entities/Cart/getCartEntity.dart';

class GetCartDto extends GetCartEntity {
  GetCartDto({super.code, super.message, super.data});

  GetCartDto.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? DataDto.fromJson(json['data']) : null;
  }
}

class DataDto extends CartDataEntity {
  DataDto({super.id, super.totalPrice, super.items});

  DataDto.fromJson(dynamic json) {
    id = json['id'];
    totalPrice = json['total_price'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(CartItemsDto.fromJson(v));
      });
    }
  }
}

class CartItemsDto extends CartItemsEntity {
  CartItemsDto({
    super.itemId,
    super.productId,
    super.name,
    super.image,
    super.quantity,
    super.price,
    super.spicy,
  });

  CartItemsDto.fromJson(dynamic json) {
    itemId = json['item_id'];
    productId = json['product_id'];
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
    spicy = json['spicy'].toString();
  }
}
