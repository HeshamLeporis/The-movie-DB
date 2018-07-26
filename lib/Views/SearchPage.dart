import 'package:flutter/material.dart';
import 'package:the_movie_db/Presenter/MoviePresenter.dart';
import 'package:the_movie_db/Views/MovieContractView.dart';
import 'package:the_movie_db/Model/Movie.dart';
import 'package:the_movie_db/Views/MovieTable.dart';
class SearchPage extends StatefulWidget{
  SearchPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<SearchPage> implements MovieContractView{
  int _counter = 0;
  final textFieldController = TextEditingController();
  List<Movie> movies;
  int currentPage=0;
  int totalPages=-1;
  MoviePresenter moviePresenter;
  _MyHomePageState(){
    moviePresenter = new MoviePresenter();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    textFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    moviePresenter.attachView(this);
  }
  

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Column(
          children: <Widget>[
            new Container(
                height: 56.0,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(color: Colors.white30),
                child: TextField(
                  controller: textFieldController,
                  onSubmitted: (keyword) {
                    bool isKeyWordToSearch = keyword.length != 0;
                    bool isSearchResultsRetrieved = totalPages != -1;
                    bool isMoreResultsExists = isSearchResultsRetrieved && currentPage<totalPages;
                    if(isKeyWordToSearch && (!isSearchResultsRetrieved || isMoreResultsExists) ) {
                      currentPage = currentPage + 1;
                      moviePresenter.searchMovie(keyword,currentPage.toString());
                    }
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Please enter a search term'
                  ),
                )
            ),
            new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(color: Colors.white70),
                  child: new MovieTable(this.movies).createMovieTable(),
                )
            )
          ]
      )

    );
  }
  void setMovies(List<Movie> movies){
    this.setState((){
      this.movies = movies;
    });

  }
  void setEmptyMovies(){
    movies = new List();
  }
  void setErrorMovies(){
    // todo display error message
  }

  void setCurrentPage(int currentPage){
    this.currentPage = currentPage;
  }

  void setTotalPages(int totalPages){
    this.totalPages = totalPages;

  }

}
