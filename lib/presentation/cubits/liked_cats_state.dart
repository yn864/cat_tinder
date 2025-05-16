part of 'liked_cats_cubit.dart';

abstract class LikedCatsState extends Equatable {
  final List<Cat> filteredCats;

  const LikedCatsState({required this.filteredCats});

  @override
  List<Object> get props => [filteredCats];
}

class LikedCatsInitial extends LikedCatsState {
  const LikedCatsInitial({required super.filteredCats});
}

class LikedCatsUpdated extends LikedCatsState {
  const LikedCatsUpdated({required super.filteredCats});
}
