class TopResponseEntity {
  TopResponseEntity({this.code, this.message, this.data});

  num? code;
  String? message;
  List<TopEntity>? data;
}

class TopEntity {
  TopEntity({this.id, this.name, this.image});

  num? id;
  String? name;
  String? image;
}
