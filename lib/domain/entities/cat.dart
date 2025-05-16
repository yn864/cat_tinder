class Cat {
  final String id;
  final String imageUrl;
  final String breed;
  final String description;
  final String temperament;
  final String origin;
  final String lifeSpan;
  final String wikipediaUrl;
  final DateTime likedAt;

  Cat({
    required this.id,
    required this.imageUrl,
    required this.breed,
    required this.description,
    required this.temperament,
    required this.origin,
    required this.lifeSpan,
    required this.wikipediaUrl,
    DateTime? likedAt,
  }) : likedAt = likedAt ?? DateTime.now();

  String get formattedDate {
    return '${likedAt.day.toString().padLeft(2, '0')}'
        '-${likedAt.month.toString().padLeft(2, '0')}'
        '-${likedAt.year.toString().substring(2)} '
        '${likedAt.hour.toString().padLeft(2, '0')}'
        '.${likedAt.minute.toString().padLeft(2, '0')}';
  }

  Cat copyWithLike() {
    return Cat(
      id: id,
      imageUrl: imageUrl,
      breed: breed,
      description: description,
      temperament: temperament,
      origin: origin,
      lifeSpan: lifeSpan,
      wikipediaUrl: wikipediaUrl,
      likedAt: DateTime.now(),
    );
  }
}
