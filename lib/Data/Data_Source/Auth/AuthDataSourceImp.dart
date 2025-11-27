import 'package:dartz/dartz.dart';
import 'package:hungery/Core/Api_Manger/Apis.dart';
import 'package:hungery/Core/Api_Manger/Endpoients.dart';
import 'package:hungery/Core/Widgets/CustomSharedPref.dart';
import 'package:hungery/Data/Model/Auth/LoginModel.dart';
import 'package:hungery/Data/Model/Auth/RegisterModel.dart';
import 'package:hungery/Domian/Entities/Auth/LoginEntity.dart';

import 'package:hungery/Domian/Entities/Auth/RegisterEntity.dart';

import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';

import 'AuthDataSource.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImp extends AuthDataSource {
  ApiManger apiManger;

  AuthDataSourceImp({required this.apiManger});

  @override
  Future<Either<Fauliers, RegisterEntity>> register(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    try {
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('📤 Register Request:');
      print('Name: $name');
      print('Email: $email');
      print('Phone: $phone');
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

      var response = await apiManger.postDate(
        EndPoints.register,
        body: {
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
        },
      );

      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('📦 Register Response:');
      print('Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

      var responseData = RegisterModel.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return Right(responseData);
      } else {
        return Left(ServerError(ErrorMassage: response.statusMessage!));
      }
    } catch (error) {
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('❌ Register Error: $error');
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      return Left(NetworkError(ErrorMassage: error.toString()));
    }
  }

  @override
  Future<Either<Fauliers, LoginEntity>> login(
    String email,
    String password,
  ) async {
    try {
      var response = await apiManger.postDate(
        EndPoints.login,
        body: {"email": email, "password": password},
      );
      var responseData = LoginModel.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        await CustomSharedPref.saveData(
          key: "token",
          value: responseData.data!.token,
        );
        return Right(responseData);
      } else {
        return Left(ServerError(ErrorMassage: response.statusMessage!));
      }
    } catch (error) {
      return Left(NetworkError(ErrorMassage: error.toString()));
    }
  }
}
