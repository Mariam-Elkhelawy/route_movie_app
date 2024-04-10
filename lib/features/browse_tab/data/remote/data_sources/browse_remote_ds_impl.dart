import 'dart:convert';

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

    return movieListModel;
  }
}
