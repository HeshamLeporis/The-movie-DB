import 'package:flutter/material.dart';
import 'package:the_movie_db/Model/Movie.dart';
class MovieTable extends ListView{
  List<Movie> movies;
  MovieTable(List<Movie> movies){
    this.movies = movies;
  }
  ListView createMovieTable(){
    return new ListView.builder(itemCount: movies == null ? 0 : movies.length,
        itemBuilder: (context, index) {
          return new Card(
            child: new Text(movies[index].title),
          );
        });

  }

}