import 'package:dartz/dartz.dart';
import 'package:hungery/Core/Api_Manger/Apis.dart';
import 'package:hungery/Core/Api_Manger/Endpoients.dart';
import 'package:hungery/Data/Data_Source/Categories/CategoryDataSource.dart';
import 'package:hungery/Data/Model/Categories/CategoryResponseDto.dart';
import 'package:hungery/Domian/Entities/Categories/CategoryEntity.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryDataSource)
class CategoryDataSourceImp implements CategoryDataSource {
  ApiManger apiManger;

  CategoryDataSourceImp({required this.apiManger});

  @override
  Future<Either<Fauliers, CategoryResponseEntity>> getCategories() async {
    try {
      var response = await apiManger.getDate(EndPoints.categories);
      var categoryResponse = CategoryResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Right(categoryResponse);
      } else {
        return Left(ServerError(ErrorMassage: response.statusMessage!));
      }
    } catch (e) {
      return Left(NetworkError(ErrorMassage: e.toString()));
    }
  }
}
