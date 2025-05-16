import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_app/domain/entities/cat.dart';
import 'package:equatable/equatable.dart';

import '../../data/database/database.dart';

part 'liked_cats_state.dart';

class LikedCatsCubit extends Cubit<LikedCatsState> {
  final AppDatabase _database;
  int get totalLikedCats => _allCats.length;

  LikedCatsCubit(this._database)
    : super(const LikedCatsInitial(filteredCats: [])) {
    _loadInitialData();
  }

  List<Cat> _allCats = [];
  String? _selectedBreed;
  String _searchQuery = '';

  Future<void> _loadInitialData() async {
    await _refreshData();
    _applyFilters();
  }

  Future<void> loadLikedCats() async {
    await _refreshData();
  }

  Future<void> addLikedCat(Cat cat) async {
    await _database.addLikedCat(
      LikedCatsCompanion.insert(
        id: cat.id,
        imageUrl: cat.imageUrl,
        breed: cat.breed,
        description: cat.description,
        temperament: cat.temperament,
        origin: cat.origin,
        lifeSpan: cat.lifeSpan,
        wikipediaUrl: cat.wikipediaUrl,
        likedAt: cat.likedAt,
      ),
    );
    await _refreshData();
  }

  Future<void> deleteCat(String catId) async {
    await _database.deleteLikedCat(catId);
    await _refreshData();
  }

  void filterCats(String? breed) {
    _selectedBreed = breed;
    _applyFilters();
  }

  void searchCats(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  Future<void> _refreshData() async {
    final entities = await _database.getAllLikedCats();
    _allCats =
        entities
            .map(
              (e) => Cat(
                id: e.id,
                imageUrl: e.imageUrl,
                breed: e.breed,
                description: e.description,
                temperament: e.temperament,
                origin: e.origin,
                lifeSpan: e.lifeSpan,
                wikipediaUrl: e.wikipediaUrl,
                likedAt: e.likedAt,
              ),
            )
            .toList();
    _applyFilters();
  }

  void _applyFilters() {
    final filtered =
        _allCats.where((cat) {
          final breedMatch =
              _selectedBreed == null || cat.breed == _selectedBreed;
          final searchMatch = cat.breed.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );
          return breedMatch && searchMatch;
        }).toList();

    emit(LikedCatsUpdated(filteredCats: filtered));
  }
}
