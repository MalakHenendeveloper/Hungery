class SideResponseEntity {
  SideResponseEntity({this.code, this.message, this.data});

  num? code;
  String? message;
  List<SideEntity>? data;
}

class SideEntity {
  SideEntity({this.id, this.name, this.image});

  num? id;
  String? name;
  String? image;
}
