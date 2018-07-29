import 'package:flutter/material.dart';
import 'package:the_movie_db/Model/Movie.dart';
import 'package:the_movie_db/Views/MovieTile.dart';
import 'package:the_movie_db/Views/SearchPage.dart';
class MovieTable extends MyHomePageState{
  List<Movie> movies;

  MovieTable(List<Movie> movies) {
    this.movies = movies;
  }

  ListView createMovieTable(ScrollController _scrollController) {
    return new ListView.builder(
        controller: _scrollController,
        itemCount: movies == null ? 0 : movies.length,
        itemBuilder: (context, index) {
          if(index>=movies.length){
            super.searchMovies(super.keyword);
          }
          return new Container(
            decoration:
                new BoxDecoration(border: new Border(bottom: new BorderSide())),
            child: new MovieTile(movies[index]).createMovieTile()

          );
        });
  }
}
