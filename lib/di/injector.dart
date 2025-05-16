import 'package:cat_app/presentation/cubits/liked_cats_cubit.dart';
import 'package:get_it/get_it.dart';

import '../data/database/database.dart';
import '../data/repositories/cat_repository_impl.dart';
import '../data/services/cat_api_service.dart';
import '../data/services/network_service.dart';
import '../domain/repositories/cat_repository.dart';
import '../domain/usecases/get_random_cat_usecase.dart';
import '../presentation/cubits/home_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  getIt.registerLazySingleton<NetworkService>(() => NetworkService());

  getIt.registerLazySingleton<CatApiService>(() => CatApiService());
  getIt.registerLazySingleton<CatRepository>(() => CatRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GetRandomCatUseCase>(
    () => GetRandomCatUseCase(getIt()),
  );
  getIt.registerFactory<LikedCatsCubit>(() => LikedCatsCubit(getIt()));

  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(getRandomCatUseCase: getIt()),
  );
}
