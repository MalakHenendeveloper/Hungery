import 'package:dartz/dartz.dart';
import 'package:hungery/Core/Api_Manger/Apis.dart';
import 'package:hungery/Core/Api_Manger/Endpoients.dart';
import 'package:hungery/Data/Data_Source/Products/ProductsDataSource.dart';
import 'package:hungery/Data/Model/Products/SideData.dart';
import 'package:hungery/Data/Model/Products/TopResponseDto.dart';
import 'package:hungery/Domian/Entities/Products/SIdeEntity.dart';
import 'package:hungery/Domian/Entities/Products/TopEntity.dart';

import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDataSource)
class ProductsDatasourceImp implements ProductDataSource {
  ApiManger apiManger;

  ProductsDatasourceImp({required this.apiManger});

  @override
  Future<Either<Fauliers, SideResponseEntity>> getSide() async {
    try {
      var response = await apiManger.getDate(EndPoints.side);
      var sideResponse = SideResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Right(sideResponse);
      } else {
        return Left(ServerError(ErrorMassage: response.statusMessage!));
      }
    } catch (e) {
      return Left(NetworkError(ErrorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Fauliers, TopResponseEntity>> getTop() async {
    try {
      var resposne = await apiManger.getDate(EndPoints.tops);
      var topResponse = TopResponseDto.fromJson(resposne.data);
      if (resposne.statusCode! <= 200 && resposne.statusCode! < 299) {
        return Right(topResponse);
      } else {
        return Left(ServerError(ErrorMassage: resposne.statusMessage!));
      }
    } catch (e) {
      return Left(NetworkError(ErrorMassage: e.toString()));
    }
  }
}
