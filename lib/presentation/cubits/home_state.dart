part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  final Cat? currentCat;

  const HomeState({this.currentCat});

  @override
  List<Object?> get props => [currentCat];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  const HomeLoaded({required Cat currentCat}) : super(currentCat: currentCat);
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message}) : super();

  @override
  List<Object?> get props => [message];
}
