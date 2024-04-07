import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:route_movie_app/core/api/api_manager.dart';
import 'package:route_movie_app/core/api/end_points.dart';
import 'package:route_movie_app/features/browse_tab/data/remote/models/MovieListModel.dart';

import '../../../../../core/utils/constants.dart';
import 'browse_remote_ds.dart';

class BrowseRemoteDSImplement implements BrowseRemoteDS {
  @override
  Future<MovieListModel> getMovieList(List<Genres>? genres) async {
    ApiManager apiManager = ApiManager();
    Response response = await apiManager.getData(EndPoints.movieList, {
      "api_key": Constants.apiKey,
    });
    MovieListModel movieListModel = MovieListModel.fromJson(
      jsonDecode(response.data.toString()),
    );

    return movieListModel;
  }
}
