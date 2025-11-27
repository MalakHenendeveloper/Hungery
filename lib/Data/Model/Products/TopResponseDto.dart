import 'package:flutter/cupertino.dart';
import 'package:hungery/Domian/Entities/Products/TopEntity.dart';

class TopResponseDto extends TopResponseEntity {
  TopResponseDto({super.code, super.message, super.data});

  TopResponseDto.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(TopData.fromJson(v));
      });
    }
  }
}

class TopData extends TopEntity {
  TopData({super.id, super.name, super.image});

  TopData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
