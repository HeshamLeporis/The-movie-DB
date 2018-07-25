import 'package:flutter/material.dart';
import 'package:the_movie_db/Model/Movie.dart';
class MovieTable extends ListView{
  List<Movie> movies;
  MovieTable(List<Movie> movies){
    this.movies = movies;
  }
  ListView createMovieTable(){
    new ListView.builder(itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${movies[index].title}'),
          );
        });

  }

}