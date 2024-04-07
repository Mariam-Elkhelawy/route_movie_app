import 'package:dio/dio.dart';
import 'package:route_movie_app/core/api/api_manager.dart';
import 'package:route_movie_app/core/api/end_points.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/features/home_tab/data/data_sources/remote/home_remote_ds.dart';
import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';
import 'package:http/http.dart' as http;

class HomeRemoteDSImplementation implements HomeRemoteDS {
  @override
  Future<PopularFilmModel> getPopularFilms() async {
    ApiManager apiManager = ApiManager();
    Response response = await apiManager.getData(EndPoints.popular, {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODczNWEwYzVkMTI0YmQ0N2IwY2UzZjQ5MGEwZDE0MCIsInN1YiI6IjY2MDBiNTc2MTk3ZGU0MDE0OTE1ODE4NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._dIN6k4iZg07W874BU5xWsWijkQC5lZ_kwRXgy2oj4s",
       "accept": "application/json"
    });
    PopularFilmModel popularFilmModel =
        PopularFilmModel.fromJson(response.data);
    return popularFilmModel;
  }
}
