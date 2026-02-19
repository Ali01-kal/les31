class MovieEntity {
  final int id;
  final String title;
  final String bannerUrl;
  final String genre;

  final String overview; // ✅ бар
  final double rating;   // ✅ бар

  const MovieEntity({
    required this.id,
    required this.title,
    required this.bannerUrl,
    required this.genre,
    required this.overview,
    required this.rating,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> j) => MovieEntity(
        id: j['id'] as int,
        title: j['title'] as String,
        bannerUrl: j['bannerUrl'] as String,
        genre: j['genre'] as String,
        overview: (j['overview'] ?? '') as String,
        rating: (j['rating'] ?? 0).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'bannerUrl': bannerUrl,
        'genre': genre,
        'overview': overview,
        'rating': rating,
      };
}
