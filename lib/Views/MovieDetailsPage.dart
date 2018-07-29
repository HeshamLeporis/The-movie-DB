import 'package:flutter/material.dart';
import 'package:the_movie_db/Model/Movie.dart';
class MovieDetailsPage extends StatelessWidget{
  final Movie movie;
  MovieDetailsPage({Key key, @required this.movie}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${movie.title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${movie.overview}'),
      ),
    );
  }

}