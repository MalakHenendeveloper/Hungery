class RegisterEntity {
  RegisterEntity({this.code, this.message, this.data});

  String? code;
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
