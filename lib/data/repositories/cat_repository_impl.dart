import 'package:cat_app/domain/entities/cat.dart';
import 'package:cat_app/domain/repositories/cat_repository.dart';
import '../services/cat_api_service.dart';

class CatRepositoryImpl implements CatRepository {
  final CatApiService apiService;

  CatRepositoryImpl(this.apiService);

  @override
  Future<Cat> getRandomCat() {
    return apiService.fetchRandomCat();
  }
}
