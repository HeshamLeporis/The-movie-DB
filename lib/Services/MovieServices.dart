import 'dart:async';
import 'dart:convert';
import 'package:the_movie_db/Model/SearchResult.dart';
import 'package:the_movie_db/Utils/fetch_data_exception.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:the_movie_db/Utils/Strings.dart';
class MovieServices{
  final JsonDecoder _decoder = new JsonDecoder();
  Future<SearchResult> searchQuery(String keyword,String page) {
    final url = new Uri.http(Strings.BASE_URL, Strings.SEARCH_URL,
        {"api_key": Strings.API_KEY, "query": keyword, "page": page});
    return http
        .get(url)
        .then((http.Response response) {
      final String jsonBody = response.body;
      final statusCode = response.statusCode;

      if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
        throw new FetchDataException(
            "Error while getting contacts [StatusCode:$statusCode, Error:${response
                .reasonPhrase}]");
      }

      final searchResultsContainer = _decoder.convert(jsonBody);
      return new SearchResult.fromMap(searchResultsContainer);
    });
  }

}