class AddToCartRequest {
  final List<CartItemRequest> items;

  AddToCartRequest({required this.items});

  /// تحويل الكائن إلى JSON للإرسال للـ API
  Map<String, dynamic> toJson() {
    return {'items': items.map((item) => item.toJson()).toList()};
  }
}

/// نموذج كل منتج في السلة
class CartItemRequest {
  final num productId; // رقم المنتج
  final num quantity; // الكمية
  final num? spicy; // مستوى الحرارة (اختياري)
  final List<num> toppings; // قائمة أرقام الإضافات
  final List<num> sideOptions; // قائمة أرقام الخيارات الجانبية

  CartItemRequest({
    required this.productId,
    required this.quantity,
    this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  /// تحويل المنتج إلى JSON
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'product_id': productId,
      'quantity': quantity,
      'toppings': toppings,
      'side_options': sideOptions,
    };
  
    // نضيف spicy فقط إذا كانت موجودة (مش null)
    // نضيف spicy فقط إذا كانت موجودة وأكبر من 0
    if (spicy != null && spicy! > 0) {
      map['spicy'] = spicy;
    }

    return map;
  }
}
