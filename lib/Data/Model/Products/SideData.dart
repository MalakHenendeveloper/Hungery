import 'package:hungery/Domian/Entities/Products/SIdeEntity.dart';

class SideResponseDto extends SideResponseEntity {
  SideResponseDto({super.code, super.message, super.data});

  SideResponseDto.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SideDataDto.fromJson(v));
      });
    }
  }
}

class SideDataDto extends SideEntity {
  SideDataDto({super.id, super.name, super.image});

  SideDataDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
