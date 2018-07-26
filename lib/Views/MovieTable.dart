import 'package:flutter/material.dart';
import 'package:the_movie_db/Model/Movie.dart';
import 'package:the_movie_db/Views/MovieTile.dart';

class MovieTable{
  List<Movie> movies;

  MovieTable(List<Movie> movies) {
    this.movies = movies;
  }

  ListView createMovieTable() {
    return new ListView.builder(
        itemCount: movies == null ? 0 : movies.length,
        itemBuilder: (context, index) {
          return new Container(
            decoration:
                new BoxDecoration(border: new Border(bottom: new BorderSide())),
            child: new MovieTile(movies[index]).createMovieTile()

          );
        });
  }
}
