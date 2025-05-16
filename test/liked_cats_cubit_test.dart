import 'package:cat_app/data/database/database.dart';
import 'package:cat_app/domain/entities/cat.dart';
import 'package:cat_app/presentation/cubits/liked_cats_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppDatabase extends Mock implements AppDatabase {}

class FakeLikedCatsCompanion extends Fake implements LikedCatsCompanion {}

LikedCat _mapCatToLikedCat(Cat cat) => LikedCat(
  id: cat.id,
  imageUrl: cat.imageUrl,
  breed: cat.breed,
  description: cat.description,
  temperament: cat.temperament,
  origin: cat.origin,
  lifeSpan: cat.lifeSpan,
  wikipediaUrl: cat.wikipediaUrl,
  likedAt: cat.likedAt,
);

LikedCatsCompanion _mapCatToCompanion(Cat cat) => LikedCatsCompanion.insert(
  id: (cat.id),
  imageUrl: (cat.imageUrl),
  breed: (cat.breed),
  description: (cat.description),
  temperament: (cat.temperament),
  origin: (cat.origin),
  lifeSpan: (cat.lifeSpan),
  wikipediaUrl: (cat.wikipediaUrl),
  likedAt: (cat.likedAt),
);

void main() {
  late MockAppDatabase mockDatabase;
  late LikedCatsCubit cubit;

  final testCats = [
    Cat(
      id: '1',
      imageUrl: 'url1',
      breed: 'Abyssinian',
      description: 'Desc',
      temperament: 'Temp',
      origin: 'Origin',
      lifeSpan: '10',
      wikipediaUrl: 'wiki',
      likedAt: DateTime.now(),
    ),
    Cat(
      id: '2',
      imageUrl: 'url2',
      breed: 'Bengal',
      description: 'Desc',
      temperament: 'Temp',
      origin: 'Origin',
      lifeSpan: '10',
      wikipediaUrl: 'wiki',
      likedAt: DateTime.now(),
    ),
  ];

  final likedCatEntities = testCats.map(_mapCatToLikedCat).toList();

  setUpAll(() {
    registerFallbackValue(FakeLikedCatsCompanion());
  });

  setUp(() {
    mockDatabase = MockAppDatabase();
    when(
      () => mockDatabase.getAllLikedCats(),
    ).thenAnswer((_) async => likedCatEntities);

    cubit = LikedCatsCubit(mockDatabase);
  });

  tearDown(() => cubit.close());

  group('LikedCatsCubit Tests', () {
    test('Add cat calls database and updates state', () async {
      final newCat = Cat(
        id: '3',
        breed: 'Siamese',
        imageUrl: 'url3',
        description: 'Desc',
        temperament: 'Temp',
        origin: 'Origin',
        lifeSpan: '10',
        wikipediaUrl: 'wiki',
        likedAt: DateTime.now(),
      );

      final newLikedCat = _mapCatToLikedCat(newCat);

      when(() => mockDatabase.addLikedCat(any())).thenAnswer((_) async {});
      when(
        () => mockDatabase.getAllLikedCats(),
      ).thenAnswer((_) async => [...likedCatEntities, newLikedCat]);

      await cubit.addLikedCat(newCat);
      verify(
        () => mockDatabase.addLikedCat(_mapCatToCompanion(newCat)),
      ).called(1);
      expect(cubit.state.filteredCats.map((e) => e.id), contains(newCat.id));
    });

    test('Delete cat removes from database and state', () async {
      when(() => mockDatabase.deleteLikedCat('1')).thenAnswer((_) async {});
      when(
        () => mockDatabase.getAllLikedCats(),
      ).thenAnswer((_) async => likedCatEntities.sublist(1));

      await cubit.deleteCat('1');

      verify(() => mockDatabase.deleteLikedCat('1')).called(1);
      expect(cubit.state.filteredCats, hasLength(1));
    });

    test('Filter cats by breed works correctly', () {
      cubit.filterCats('Abyssinian');
      expect(
        cubit.state.filteredCats,
        everyElement((cat) => cat.breed == 'Abyssinian'),
      );
    });

    test('Total liked cats returns correct count', () {
      expect(cubit.totalLikedCats, testCats.length);
    });

    test('Empty state when database has no cats', () async {
      when(() => mockDatabase.getAllLikedCats()).thenAnswer((_) async => []);

      await cubit.loadLikedCats();
      expect(cubit.state.filteredCats, isEmpty);
    });
  });
}
