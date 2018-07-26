import 'package:the_movie_db/Model/Movie.dart';
class SearchResult{
  final int currentPage;
  final int totalPages;
  final List<Movie> movies;

  const SearchResult({this.currentPage, this.totalPages, this.movies

  });


  SearchResult.fromMap(Map<String, dynamic>  map) :
        currentPage = map['page'],
        movies = (map['results'] as List).map((movie) => Movie.fromMap(movie)).toList(),
        totalPages = map['total_pages'];

}