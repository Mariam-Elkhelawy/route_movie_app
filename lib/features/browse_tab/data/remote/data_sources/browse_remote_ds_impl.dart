import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:route_movie_app/core/api/api_manager.dart';
import 'package:route_movie_app/core/api/end_points.dart';
import 'package:route_movie_app/features/browse_tab/data/remote/models/MovieListModel.dart';
import 'browse_remote_ds.dart';

class BrowseRemoteDSImplement implements BrowseRemoteDS {
  @override
  Future<MovieListModel> getMovieList() async {
    ApiManager apiManager = ApiManager();

    Response response =
        await apiManager.getData(endPoint: EndPoints.movieList, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODczNWEwYzVkMTI0YmQ0N2IwY2UzZjQ5MGEwZDE0MCIsInN1YiI6IjY2MDBiNTc2MTk3ZGU0MDE0OTE1ODE4NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._dIN6k4iZg07W874BU5xWsWijkQC5lZ_kwRXgy2oj4s",
    }, queryParameters: {
      'language': 'en-US'
    });
    MovieListModel movieListModel = MovieListModel.fromJson(response.data);


    
    print(response.data.toString());
    if (response.statusCode == 200) {
      return movieListModel;
    } else {
      throw Exception('Failed to load album');
    }
  }
  /* Future<MovieListModel> getMovieList() async {
      final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/genre/movie/list?api_key=f4bfbdc2321bbb554ce4a12311137853&language=en-US'),
      );
      var genresResponse = MovieListModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return genresResponse;
      } else {
        throw Exception('Failed to load album');
      }


    }*/
}
