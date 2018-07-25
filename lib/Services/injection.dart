import 'package:the_movie_db/Services/MovieServices.dart';

class Injector {

  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  MovieServices get sharedMovieServices {
    return new MovieServices();
  }
}