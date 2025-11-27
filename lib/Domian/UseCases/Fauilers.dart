abstract class Fauliers {
  String ErrorMassage;

  Fauliers({required this.ErrorMassage});
}

class ServerError extends Fauliers {
  ServerError({required super.ErrorMassage});
}

class NetworkError extends Fauliers {
  NetworkError({required super.ErrorMassage});
}
