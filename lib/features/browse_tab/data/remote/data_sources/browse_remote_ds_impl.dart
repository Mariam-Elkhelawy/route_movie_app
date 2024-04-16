import 'package:dio/dio.dart';
import 'package:route_movie_app/core/api/api_manager.dart';
import 'package:route_movie_app/core/api/end_points.dart';
import 'package:route_movie_app/core/utils/app_strings.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/features/browse_tab/data/remote/models/MovieListModel.dart';
import 'browse_remote_ds.dart';

class BrowseRemoteDSImplement implements BrowseRemoteDS {
  @override
  Future<MovieListModel> getMovieList() async {
    ApiManager apiManager = ApiManager();

    Response response =
        await apiManager.getData(endPoint: EndPoints.movieList, headers: {
      AppStrings.authorization: Constants.apiToken,
    }, queryParameters: {
      'language': 'en-US'
    });
    MovieListModel movieListModel = MovieListModel.fromJson(response.data);

    if (response.statusCode == 200) {
      return movieListModel;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
