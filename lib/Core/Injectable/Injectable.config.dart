// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../Data/Data_Source/Auth/AuthDataSource.dart' as _i257;
import '../../Data/Data_Source/Auth/AuthDataSourceImp.dart' as _i868;
import '../../Data/Data_Source/Cart/CartDataSource.dart' as _i204;
import '../../Data/Data_Source/Cart/CartDataSourceImp.dart' as _i961;
import '../../Data/Data_Source/Categories/CategoryDataSource.dart' as _i131;
import '../../Data/Data_Source/Categories/CategoryDataSourceImp.dart' as _i223;
import '../../Data/Data_Source/Home/HomeDataSource.dart' as _i825;
import '../../Data/Data_Source/Home/HomeDataSourceImp.dart' as _i780;
import '../../Data/Data_Source/Products/ProductsDataSource.dart' as _i785;
import '../../Data/Data_Source/Products/ProductsDataSourceImp.dart' as _i390;
import '../../Data/Repositories/AuthRepositoryImp.dart' as _i929;
import '../../Data/Repositories/CartRepositoryImp.dart' as _i335;
import '../../Data/Repositories/CategoryRepoImp.dart' as _i217;
import '../../Data/Repositories/HomeRepositiryImp.dart' as _i47;
import '../../Data/Repositories/ProductsRepoImp.dart' as _i115;
import '../../Domian/Repositories/AuthRepository.dart' as _i177;
import '../../Domian/Repositories/CartRepository.dart' as _i737;
import '../../Domian/Repositories/CategoryRepo.dart' as _i996;
import '../../Domian/Repositories/HomeRepository.dart' as _i878;
import '../../Domian/Repositories/ProductsRepo.dart' as _i570;
import '../../Domian/UseCases/Auth/LoginUseCase.dart' as _i266;
import '../../Domian/UseCases/Auth/RegisterUseCase.dart' as _i1058;
import '../../Domian/UseCases/Cart/AddCartUseCase.dart' as _i819;
import '../../Domian/UseCases/Cart/deleteCartUseCase.dart' as _i522;
import '../../Domian/UseCases/Cart/getCartUseCase.dart' as _i40;
import '../../Domian/UseCases/Categories/GetCategoriesUseCase.dart' as _i107;
import '../../Domian/UseCases/Home/ProductsUseCase.dart' as _i1020;
import '../../Domian/UseCases/Products/Side.dart' as _i281;
import '../../Domian/UseCases/Products/Toppings.dart' as _i100;
import '../../Feature/Auth/Login/Screen/Cubit/LoginViewModel.dart' as _i448;
import '../../Feature/Auth/SIgnUp/Screen/Cubit/RegisterViewModel.dart' as _i814;
import '../../Feature/Cart/Screen/Cubit/CartViewModel.dart' as _i507;
import '../../Feature/Home/Screen/Cubit/HomeViewModel.dart' as _i85;
import '../../Feature/Products/Screen/Cubit/ProductViewModel.dart' as _i1014;
import '../Api_Manger/Apis.dart' as _i775;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i775.ApiManger>(() => _i775.ApiManger());
    gh.factory<_i204.CartDataSource>(
      () => _i961.CartDataSourceImp(apiManger: gh<_i775.ApiManger>()),
    );
    gh.factory<_i785.ProductDataSource>(
      () => _i390.ProductsDatasourceImp(apiManger: gh<_i775.ApiManger>()),
    );
    gh.factory<_i825.HomeDataSource>(
      () => _i780.HomeDataSourceImp(apiManger: gh<_i775.ApiManger>()),
    );
    gh.factory<_i570.ProductRepository>(
      () => _i115.ProductsRepositoryImp(
        dataSource: gh<_i785.ProductDataSource>(),
      ),
    );
    gh.factory<_i257.AuthDataSource>(
      () => _i868.AuthDataSourceImp(apiManger: gh<_i775.ApiManger>()),
    );
    gh.factory<_i131.CategoryDataSource>(
      () => _i223.CategoryDataSourceImp(apiManger: gh<_i775.ApiManger>()),
    );
    gh.factory<_i737.CartRepository>(
      () => _i335.CartRepositoryImp(dataSource: gh<_i204.CartDataSource>()),
    );
    gh.factory<_i819.AddToCartUseCase>(
      () => _i819.AddToCartUseCase(repository: gh<_i737.CartRepository>()),
    );
    gh.factory<_i522.DeleteCartUseCase>(
      () => _i522.DeleteCartUseCase(repository: gh<_i737.CartRepository>()),
    );
    gh.factory<_i40.GetCartUseCase>(
      () => _i40.GetCartUseCase(repo: gh<_i737.CartRepository>()),
    );
    gh.factory<_i507.CartViewModel>(
      () => _i507.CartViewModel(
        cartUseCase: gh<_i40.GetCartUseCase>(),
        deleteCartUseCase: gh<_i522.DeleteCartUseCase>(),
      ),
    );
    gh.factory<_i281.GetSideUseCase>(
      () => _i281.GetSideUseCase(repository: gh<_i570.ProductRepository>()),
    );
    gh.factory<_i100.GetTopUseCase>(
      () => _i100.GetTopUseCase(repository: gh<_i570.ProductRepository>()),
    );
    gh.factory<_i878.HomeRepository>(
      () => _i47.HomeRepositoryImp(homeDataSource: gh<_i825.HomeDataSource>()),
    );
    gh.factory<_i1014.ProductViewModel>(
      () => _i1014.ProductViewModel(
        sideUseCase: gh<_i281.GetSideUseCase>(),
        getTopUseCase: gh<_i100.GetTopUseCase>(),
        cart: gh<_i819.AddToCartUseCase>(),
      ),
    );
    gh.factory<_i177.AuthRepository>(
      () => _i929.AuthRepositoryImp(authDataSource: gh<_i257.AuthDataSource>()),
    );
    gh.factory<_i1020.ProductUseCase>(
      () => _i1020.ProductUseCase(homeRepository: gh<_i878.HomeRepository>()),
    );
    gh.factory<_i996.CategoryRepository>(
      () => _i217.CategoryRepositoryImp(
        dataSource: gh<_i131.CategoryDataSource>(),
      ),
    );
    gh.factory<_i107.GetCategoriesUseCase>(
      () => _i107.GetCategoriesUseCase(
        repository: gh<_i996.CategoryRepository>(),
      ),
    );
    gh.factory<_i1058.RegisterUseCase>(
      () => _i1058.RegisterUseCase(auth: gh<_i177.AuthRepository>()),
    );
    gh.factory<_i85.HomeViewModel>(
      () => _i85.HomeViewModel(
        useCase: gh<_i1020.ProductUseCase>(),
        categoriesUseCase: gh<_i107.GetCategoriesUseCase>(),
      ),
    );
    gh.factory<_i266.LoginUseCase>(
      () => _i266.LoginUseCase(authRepository: gh<_i177.AuthRepository>()),
    );
    gh.factory<_i448.LoginViewModel>(
      () => _i448.LoginViewModel(useCase: gh<_i266.LoginUseCase>()),
    );
    gh.factory<_i814.RegisterViewModel>(
      () => _i814.RegisterViewModel(useCase: gh<_i1058.RegisterUseCase>()),
    );
    return this;
  }
}
