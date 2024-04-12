import 'package:http/http.dart';
import 'package:route_movie_app/core/api/api_manager.dart';
import 'package:route_movie_app/core/api/end_points.dart';
import 'package:route_movie_app/core/utils/app_strings.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/features/discover_movie/data/models/MovieDiscoverModel.dart';

import 'discover_movie_ds.dart';

class DiscoverMovieRemoteDSImplement implements DiscoverMovieRemoteDS {
  ApiManager apiManager = ApiManager();
  @override
  Future<MovieDiscoverModel> getMovieDiscoverList(int genreId) async {
    var response = await apiManager.getData(
      endPoint: EndPoints.discoverMovie,
      headers: {
        AppStrings.authorization: Constants.apiToken,
      },
      queryParameters: {"with_genres": genreId},
    );
    MovieDiscoverModel movieDiscoverModel =
        MovieDiscoverModel.fromJson(response.data);

    if (response.statusCode == 200) {
      return movieDiscoverModel;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
