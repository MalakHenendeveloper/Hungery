import 'package:hungery/Domian/Entities/Categories/CategoryEntity.dart';

class CategoryResponseDto extends CategoryResponseEntity {
  CategoryResponseDto({super.code, super.message, super.data});

  CategoryResponseDto.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryData.fromJson(v));
      });
    }
  }
}

class CategoryData extends CategoryEntity {
  CategoryData({super.id, super.name});

  CategoryData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
}
