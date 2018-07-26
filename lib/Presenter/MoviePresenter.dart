import 'package:the_movie_db/Views/MovieContractView.dart';
import 'package:the_movie_db/Services/injection.dart';
import 'package:the_movie_db/Model/SearchResult.dart';
class MoviePresenter{
  MovieContractView movieContractView;

  void attachView(MovieContractView movieView){
    this.movieContractView = movieView;
  }
  void detachView(){
    this.movieContractView = null;
  }

  void searchMovie(String keyword, String page){
    Injector().sharedMovieServices.searchQuery(keyword, page).
    then((searchResults) => this.setSearchResultsAttributes(searchResults)).
    catchError((onError){
      print(onError);
      movieContractView.setErrorMovies();
    });
  }

  void setSearchResultsAttributes(SearchResult searchResult){
    movieContractView.setCurrentPage(searchResult.currentPage);
    movieContractView.setTotalPages(searchResult.totalPages);
    movieContractView.setMovies(searchResult.movies);

  }
}