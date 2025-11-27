abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeError extends HomeState {
  String mas;

  HomeError({required this.mas});
}

class ChengeCategorySuccess extends HomeState {}
