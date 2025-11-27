class CategoryResponseEntity {
  CategoryResponseEntity({this.code, this.message, this.data});

  num? code;
  String? message;
  List<CategoryEntity>? data;
}

class CategoryEntity {
  CategoryEntity({this.id, this.name});

  num? id;
  String? name;
}
