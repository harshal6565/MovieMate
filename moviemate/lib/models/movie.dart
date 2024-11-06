class Movie {
  final String title;
  final String year;
  final String poster;
  final String imdbID;
  final String? imdbRating;
  final String? genre;

  Movie({
    required this.title,
    required this.year,
    required this.poster,
    required this.imdbID,
    this.imdbRating,
    this.genre,
  });

  String get formattedGenre {
    if (genre == null || genre!.isEmpty) return '';
    return genre!.split(',').join(' | ').trim();
  }

  List<String> get genreList {
    if (genre == null || genre!.isEmpty) return [];
    return genre!.split(',').map((e) => e.trim()).toList();
  }

  factory Movie.fromSearchJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      poster: json['Poster'] ?? '',
      imdbID: json['imdbID'] ?? '',
      imdbRating: json['imdbRating'],
      genre: json['Genre'],
    );
  }
}
