import '../entities/cat.dart';

abstract class CatRepository {
  Future<Cat> getRandomCat();
}
