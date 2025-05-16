import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_app/domain/usecases/get_random_cat_usecase.dart';
import 'package:cat_app/domain/entities/cat.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetRandomCatUseCase _getRandomCatUseCase;

  HomeCubit({required GetRandomCatUseCase getRandomCatUseCase})
    : _getRandomCatUseCase = getRandomCatUseCase,
      super(HomeInitial());

  void loadCat() async {
    emit(HomeLoading());
    try {
      final cat = await _getRandomCatUseCase();
      emit(HomeLoaded(currentCat: cat));
    } catch (e) {
      emit(
        const HomeError(
          message: 'No internet connection. Please check your network.',
        ),
      );
    }
  }

  void likeCat() {
    if (state is HomeLoaded) {
      loadCat();
    }
  }

  void dislikeCat() {
    loadCat();
  }
}
