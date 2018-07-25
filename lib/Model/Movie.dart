class Movie {

  final String title;
  final String releaseDate;
  final String overview;
  final String posterURL;

  const Movie({this.title, this.releaseDate, this.overview, this.posterURL});

  Movie.fromMap(Map<String, dynamic>  map) :
        title = map['title'],
        releaseDate = map['release_date'],
        overview = map['overview'],
        posterURL = map['poster_path'];


}