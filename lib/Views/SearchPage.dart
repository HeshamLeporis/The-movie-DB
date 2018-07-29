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
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<SearchPage> implements MovieContractView{
  int _counter = 0;
  final textFieldController = TextEditingController();
  List<Movie> movies;
  int _currentPage=0;
  int _totalPages=-1;
  MoviePresenter moviePresenter;
  ScrollController _scrollController;
  String keyword="";
  MyHomePageState();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    textFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    moviePresenter = new MoviePresenter();
    this.movies = new List();
    moviePresenter.attachView(this);
    _scrollController = new ScrollController()..addListener(_scrollListener);
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
                    this.keyword = keyword;
                    searchMovies(this.keyword);
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
                  child: new MovieTable(this.movies).createMovieTable(_scrollController),
                )
            )
          ]
      )

    );
  }

  void searchMovies(String keyword){
    bool isKeyWordToSearch = keyword.length != 0;
    bool isSearchResultsRetrieved = _totalPages != -1;
    bool isMoreResultsExists = isSearchResultsRetrieved && _currentPage<_totalPages;
    if(isKeyWordToSearch && (!isSearchResultsRetrieved || isMoreResultsExists) ) {
      _currentPage = _currentPage + 1;
      moviePresenter.searchMovie(keyword,_currentPage.toString());
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      searchMovies(this.keyword);
    }

  }

  void setMovies(List<Movie> movies){
    this.setState((){
      this.movies.addAll(movies);
    });

  }
  void setEmptyMovies(){
    movies = new List();
  }
  void setErrorMovies(){
    // todo display error message
  }

  void setCurrentPage(int currentPage){
    this._currentPage = currentPage;
  }

  void setTotalPages(int totalPages){
    this._totalPages = totalPages;

  }

}
