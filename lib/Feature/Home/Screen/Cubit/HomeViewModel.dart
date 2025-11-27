import 'package:bloc/bloc.dart';
import 'package:hungery/Domian/Entities/Categories/CategoryEntity.dart';
import 'package:hungery/Domian/Entities/Products/ProductsEntity.dart';
import 'package:hungery/Domian/UseCases/Categories/GetCategoriesUseCase.dart';
import 'package:hungery/Domian/UseCases/Home/ProductsUseCase.dart';
import 'package:hungery/Feature/Home/Screen/Cubit/HomeState.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel({required this.useCase, required this.categoriesUseCase})
    : super(HomeInitial());
  ProductUseCase useCase;
  GetCategoriesUseCase categoriesUseCase;

  List<CategoryEntity> categories = [];
  List<ProductDataEntity> products = [];
  int selectindex = 0;

  changeCategory(int index) {
    emit(HomeInitial());
    selectindex = index;
    emit(ChengeCategorySuccess());
  }

  void getProducts() async {
    emit(HomeLoading());
    var either = await useCase.invoke();
    either.fold((error) => emit(HomeError(mas: error.ErrorMassage)), (
      response,
    ) {
      products = response.data!;
      emit(HomeSuccess());
    });
  }

  void getCategories() async {
    var either = await categoriesUseCase.call();
    either.fold((error) => print(error.ErrorMassage), (response) {
      categories = response.data!;
      // Add 'All' category at the beginning
      categories.insert(0, CategoryEntity(id: 0, name: 'All'));
      emit(HomeSuccess());
    });
  }
}
