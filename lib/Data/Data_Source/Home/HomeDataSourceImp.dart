import 'package:dartz/dartz.dart';
import 'package:hungery/Core/Api_Manger/Apis.dart';
import 'package:hungery/Core/Api_Manger/Endpoients.dart';
import 'package:hungery/Data/Data_Source/Home/HomeDataSource.dart';
import 'package:hungery/Data/Model/Products/ProductsModel.dart';
import 'package:hungery/Domian/Entities/Products/ProductsEntity.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImp implements HomeDataSource {
  ApiManger apiManger;

  HomeDataSourceImp({required this.apiManger});

  @override
  Future<Either<Fauliers, ProductsEntity>> getProducts() async {
    try {
      var response = await apiManger.getDate(EndPoints.products);
      var productsResponse = ProductsModel.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Right(productsResponse);
      } else {
        return Left(ServerError(ErrorMassage: response.statusMessage!));
      }
    } catch (e) {
      return Left(NetworkError(ErrorMassage: 'Error'));
    }
  }
}
