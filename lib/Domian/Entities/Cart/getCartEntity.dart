class GetCartEntity {
  GetCartEntity({this.code, this.message, this.data});

  num? code;
  String? message;
  CartDataEntity? data;
}

class CartDataEntity {
  CartDataEntity({this.id, this.totalPrice, this.items});

  num? id;
  String? totalPrice;
  List<CartItemsEntity>? items;
}

class CartItemsEntity {
  CartItemsEntity({
    this.itemId,
    this.productId,
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.spicy,
  });

  num? itemId;
  num? productId;
  String? name;
  String? image;
  num? quantity;
  String? price;
  String? spicy;
}
