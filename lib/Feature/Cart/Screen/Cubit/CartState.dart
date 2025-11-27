import 'package:hungery/Domian/Entities/Cart/getCartEntity.dart';
import 'package:hungery/Domian/UseCases/Fauilers.dart';

abstract class CartState {}

class CartInatial extends CartState {}

class CartLoading extends CartState {}

class CartError extends CartState {
  Fauliers fauliers;

  CartError({required this.fauliers});
}

class CartSuccess extends CartState {
  GetCartEntity cart;

  CartSuccess({required this.cart});
}
