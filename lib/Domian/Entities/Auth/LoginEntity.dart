class LoginEntity {
  LoginEntity({this.code, this.message, this.data});

  num? code;
  String? message;
  DataEntity? data;
}

class DataEntity {
  DataEntity({this.token, this.name, this.email, this.image});

  String? token;
  String? name;
  String? email;
  String? image;
}
