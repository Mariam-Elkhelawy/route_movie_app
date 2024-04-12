import 'package:http/http.dart';
import 'package:route_movie_app/core/api/api_manager.dart';
import 'package:route_movie_app/core/api/end_points.dart';
import 'package:route_movie_app/features/discover_movie/data/models/MovieDiscoverModel.dart';

import 'discover_movie_ds.dart';

class DiscoverMovieRemoteDSImplement implements DiscoverMovieRemoteDS {
  ApiManager apiManager = ApiManager();
  @override
  Future<MovieDiscoverModel> getMovieDiscoverList(int genreId) async {
    var response = await apiManager.getData(
      endPoint: EndPoints.discoverMovie,
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODczNWEwYzVkMTI0YmQ0N2IwY2UzZjQ5MGEwZDE0MCIsInN1YiI6IjY2MDBiNTc2MTk3ZGU0MDE0OTE1ODE4NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._dIN6k4iZg07W874BU5xWsWijkQC5lZ_kwRXgy2oj4s",
      },
      queryParameters: {
        "with_genres": genreId
      },
    );
    MovieDiscoverModel movieDiscoverModel = MovieDiscoverModel.fromJson(response.data);

    if (response.statusCode == 200) {
      return movieDiscoverModel;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
