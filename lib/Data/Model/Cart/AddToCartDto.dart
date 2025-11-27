import 'dart:convert';

class AddToCartDto {
  List<ItemsCart>? items;
  String? message;
  String? status;

  AddToCartDto({this.items, this.message, this.status});

  /// تحويل JSON إلى كائن Dart مع معالجة أشكال مختلفة
  AddToCartDto.fromJson(dynamic json) {
    try {
      // حالة 1: الـ response فيه data wrapper
      if (json is Map && json.containsKey('data')) {
        var data = json['data'];

        // إذا data فيها cart
        if (data is Map && data.containsKey('cart')) {
          _parseItems(data['cart']);
        }
        // إذا data فيها items مباشرة
        else if (data is Map && data.containsKey('items')) {
          _parseItems(data);
        }
        // إذا data نفسها array
        else if (data is List) {
          items = data.map((v) => ItemsCart.fromJson(v)).toList();
        }

        // استخراج message و status لو موجودين
        if (json.containsKey('message')) {
          message = json['message']?.toString();
        }
        if (json.containsKey('status')) {
          status = json['status']?.toString();
        }
      }
      // حالة 2: الـ response فيه items مباشرة
      else if (json is Map && json.containsKey('items')) {
        _parseItems(json);
      }
      // حالة 3: الـ response array مباشرة
      else if (json is List) {
        items = json.map((v) => ItemsCart.fromJson(v)).toList();
      }
    } catch (e) {
      print('❌ Error parsing AddToCartDto: $e');
      items = [];
    }
  }

  /// دالة مساعدة لاستخراج items
  void _parseItems(dynamic data) {
    if (data != null && data['items'] != null) {
      items = [];
      for (var v in data['items']) {
        items?.add(ItemsCart.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (message != null) {
      map['message'] = message;
    }
    if (status != null) {
      map['status'] = status;
    }
    return map;
  }
}

class ItemsCart {
  num? productId;
  num? quantity;
  num? spicy;
  List<num>? toppings;
  List<num>? sideOptions;

  ItemsCart({
    this.productId,
    this.quantity,
    this.spicy,
    this.toppings,
    this.sideOptions,
  });

  ItemsCart.fromJson(dynamic json) {
    productId = _parseNum(json['product_id']);
    quantity = _parseNum(json['quantity']);
    spicy = _parseNum(json['spicy']);
    toppings = _safeList(json['toppings']);
    sideOptions = _safeList(json['side_options']);
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'spicy': spicy,
      'toppings': toppings,
      'side_options': sideOptions,
    };
  }

  num? _parseNum(dynamic value) {
    if (value == null) return null;
    if (value is num) return value;
    if (value is String) return num.tryParse(value);
    return null;
  }

  List<num> _safeList(dynamic value) {
    if (value == null) return [];

    if (value is Map) {
      return value.values
          .map((e) => _parseNum(e))
          .where((e) => e != null)
          .cast<num>()
          .toList();
    }

    if (value is String) {
      try {
        var decoded = jsonDecode(value);
        if (decoded is Map) {
          return decoded.values
              .map((e) => _parseNum(e))
              .where((e) => e != null)
              .cast<num>()
              .toList();
        }
        if (decoded is List) {
          return decoded
              .map((e) => _parseNum(e))
              .where((e) => e != null)
              .cast<num>()
              .toList();
        }
        return [];
      } catch (e) {
        return [];
      }
    }

    if (value is List) {
      return value
          .map((e) => _parseNum(e))
          .where((e) => e != null)
          .cast<num>()
          .toList();
    }

    return [];
  }
}
