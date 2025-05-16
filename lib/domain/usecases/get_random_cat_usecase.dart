import '../entities/cat.dart';
import '../repositories/cat_repository.dart';

class GetRandomCatUseCase {
  final CatRepository repository;

  GetRandomCatUseCase(this.repository);

  Future<Cat> call() async {
    return await repository.getRandomCat();
  }
}
