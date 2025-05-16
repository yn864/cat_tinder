import 'package:cat_app/domain/entities/cat.dart';

class CatModel extends Cat {
  CatModel({
    required String id,
    required String imageUrl,
    required String breed,
    required String description,
    required String temperament,
    required String origin,
    required String lifeSpan,
    required String wikipediaUrl,
    DateTime? likedAt,
  }) : super(
         id: id,
         imageUrl: imageUrl,
         breed: breed,
         description: description,
         temperament: temperament,
         origin: origin,
         lifeSpan: lifeSpan,
         wikipediaUrl: wikipediaUrl,
         likedAt: likedAt,
       );

  factory CatModel.fromJson(Map<String, dynamic> json) {
    final breedData =
        (json['breeds'] != null && json['breeds'].isNotEmpty)
            ? json['breeds'][0]
            : {};

    return CatModel(
      id: json['id'],
      imageUrl: json['url'],
      breed: breedData['name'] ?? 'Unknown',
      description: breedData['description'] ?? 'No description available',
      temperament: breedData['temperament'] ?? 'Not specified',
      origin: breedData['origin'] ?? 'Unknown',
      lifeSpan: breedData['life_span'] ?? 'N/A',
      wikipediaUrl: breedData['wikipedia_url'] ?? '',
    );
  }
}
