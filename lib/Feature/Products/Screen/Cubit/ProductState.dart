import 'package:hungery/Data/Model/Cart/AddToCartDto.dart';
import 'package:hungery/Domian/Entities/Products/SIdeEntity.dart';
import 'package:hungery/Domian/Entities/Products/TopEntity.dart';

import 'package:hungery/Domian/UseCases/Fauilers.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductError extends ProductState {
  Fauliers fauliers;

  ProductError({required this.fauliers});
}

class ProductTopLoading extends ProductState {}

class ProductTopSuccess extends ProductState {
  final TopResponseEntity top;

  ProductTopSuccess({required this.top});
}

class ProductTopError extends ProductState {
  final Fauliers message;

  ProductTopError({required this.message});
}

class ProductSideLoading extends ProductState {}

class ProductSideSuccess extends ProductState {
  SideResponseEntity sideEntity;

  ProductSideSuccess({required this.sideEntity});
}

class ProductSideError extends ProductState {
  final Fauliers message;

  ProductSideError({required this.message});
}

class AddToCart extends ProductState {}

class AddToCartLoading extends ProductState {}

class AddToCartSuccess extends ProductState {
  final AddToCartDto itemsCart;

  AddToCartSuccess({required this.itemsCart});
}

class AddToCartError extends ProductState {
  Fauliers message;

  AddToCartError({required this.message});
}

class RemoveFromCart extends ProductState {}

class ChengeSliderState extends ProductState {
  final double value;

  ChengeSliderState(this.value);
}

class SelectionUpdated extends ProductState {}

class QuantityUpdated extends ProductState {
  final int quantity;

  QuantityUpdated(this.quantity);
}
