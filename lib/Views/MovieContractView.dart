import 'package:the_movie_db/Model/Movie.dart';
abstract class MovieContractView{
  void setMovies(List<Movie> movies);
  void setEmptyMovies();
  void setErrorMovies();
  void setCurrentPage(int currentPage);
  void setTotalPages(int totalPages);
}