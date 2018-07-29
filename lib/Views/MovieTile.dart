import 'package:flutter/material.dart';
import 'package:the_movie_db/Model/Movie.dart';
import 'package:the_movie_db/Utils/Strings.dart';
import 'package:the_movie_db/Views/MovieDetailsPage.dart';
class MovieTile{
  Movie movie;
  MovieTile(Movie movie){
    this.movie = movie;
  }
  ListTile createMovieTile(BuildContext context){
    var movieImage = movie.posterURL != null ?  Image.network(
      Strings.POSTER_HOST_URL + movie.posterURL,
      fit: BoxFit.fill,
    ) : Image.asset("assets/Alternate_image.png",
      fit: BoxFit.fill,
    );

    return new ListTile(
        leading: new Container(
            height: 150.0,
            width: 100.0,
            child: movieImage
        ),
        title: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(movie.title,
                style: new TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                )

            ),
            new Text(movie.releaseDate,
              style: new TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            )
          ],
        ),
        subtitle: new Text(movie.overview,
          style: new TextStyle(
            fontSize: 18.0,
            color: Colors.grey,
          ),
        ),
      onTap: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => MovieDetailsPage(movie: movie)
          ));
      },
    );
  }
}