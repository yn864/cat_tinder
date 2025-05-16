import 'package:bloc_test/bloc_test.dart';
import 'package:cat_app/domain/entities/cat.dart';
import 'package:cat_app/domain/usecases/get_random_cat_usecase.dart';
import 'package:cat_app/presentation/cubits/home_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetRandomCatUseCase extends Mock implements GetRandomCatUseCase {}

void main() {
  late HomeCubit homeCubit;
  late MockGetRandomCatUseCase mockUseCase;

  final testCat = Cat(
    id: '1',
    imageUrl: 'url',
    breed: 'Breed',
    description: 'Desc',
    temperament: 'Temp',
    origin: 'Origin',
    lifeSpan: '10',
    wikipediaUrl: 'wiki',
  );

  setUp(() {
    mockUseCase = MockGetRandomCatUseCase();
    homeCubit = HomeCubit(getRandomCatUseCase: mockUseCase);

    when(() => mockUseCase()).thenAnswer((_) async => testCat);
  });

  tearDown(() => homeCubit.close());

  group('HomeCubit', () {
    test('initial state is HomeInitial', () {
      expect(homeCubit.state, isA<HomeInitial>());
    });
    blocTest(
      'loadCat emits [Loading, Loaded] on success',
      build: () => homeCubit,
      act: (cubit) => cubit.loadCat(),
      expect:
          () => [
            isA<HomeLoading>(),
            isA<HomeLoaded>().having((s) => s.currentCat, 'cat', testCat),
          ],
      verify: (_) => verify(() => mockUseCase()).called(1),
    );

    blocTest(
      'loadCat emits [Loading, Error] on failure',
      build: () {
        when(() => mockUseCase()).thenThrow(Exception('Network error'));
        return homeCubit;
      },
      act: (cubit) => cubit.loadCat(),
      expect:
          () => [
            isA<HomeLoading>(),
            isA<HomeError>().having(
              (s) => s.message,
              'message',
              'No internet connection. Please check your network.',
            ),
          ],
    );
    blocTest(
      'likeCat loads new cat if current state is Loaded',
      build: () => homeCubit,
      seed: () => HomeLoaded(currentCat: testCat),
      act: (cubit) => cubit.likeCat(),
      expect: () => [isA<HomeLoading>(), isA<HomeLoaded>()],
      verify: (_) => verify(() => mockUseCase()).called(1),
    );

    blocTest(
      'likeCat does nothing if state is not Loaded',
      build: () => homeCubit,
      seed: () => HomeInitial(),
      act: (cubit) => cubit.likeCat(),
      expect: () => [],
      verify: (_) => verifyNever(() => mockUseCase()),
    );

    blocTest(
      'dislikeCat always loads new cat',
      build: () => homeCubit,
      act: (cubit) => cubit.dislikeCat(),
      expect: () => [isA<HomeLoading>(), isA<HomeLoaded>()],
      verify: (_) => verify(() => mockUseCase()).called(1),
    );
  });
}
