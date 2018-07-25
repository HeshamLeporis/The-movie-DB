import 'package:the_movie_db/Views/MovieContractView.dart';
import 'package:the_movie_db/Services/injection.dart';
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
    then((searchResults) => movieContractView.setMovies(searchResults.movies)).
    catchError((onError){
      print(onError);
      movieContractView.setErrorMovies();
    });
  }
}