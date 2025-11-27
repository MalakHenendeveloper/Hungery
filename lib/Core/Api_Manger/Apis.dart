import 'package:dio/dio.dart';
import 'package:hungery/Core/Api_Manger/Endpoients.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class ApiManger {
  late Dio dio;

  ApiManger() {
    dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ),
    );
  }

  Future<Response> getDate(String endpoint, {Map<String, dynamic>? headers}) {
    return dio.get(
      EndPoints.baseUrl + endpoint,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> postDate(
    String endpoint, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) {
    return dio.post(
      EndPoints.baseUrl + endpoint,
      data: body,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> deleteDate(
    String endpoint, {
    Map<String, dynamic>? headers,
  }) {
    return dio.delete(
      EndPoints.baseUrl + endpoint,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }
}
