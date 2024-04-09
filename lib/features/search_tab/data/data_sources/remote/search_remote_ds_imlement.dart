import 'package:dio/dio.dart';
import 'package:route_movie_app/core/api/api_manager.dart';
import 'package:route_movie_app/core/api/end_points.dart';
import 'package:route_movie_app/features/search_tab/data/data_sources/remote/search_remote_ds.dart';
import 'package:route_movie_app/features/search_tab/data/models/SearchFilmModel.dart';

class SearchRemoteDSImplementation implements SearchRemoteDs {
  @override
  Future<SearchFilmModel> getSearchFilms(String searchQuery) async {
    ApiManager apiManager = ApiManager();
    Response response =
        await apiManager.getData(endPoint: EndPoints.search, queryParameters: {
      'query': searchQuery
    }, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODczNWEwYzVkMTI0YmQ0N2IwY2UzZjQ5MGEwZDE0MCIsInN1YiI6IjY2MDBiNTc2MTk3ZGU0MDE0OTE1ODE4NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._dIN6k4iZg07W874BU5xWsWijkQC5lZ_kwRXgy2oj4s",
    });
    SearchFilmModel searchFilmModel = SearchFilmModel.fromJson(response.data);
    return searchFilmModel;
  }
}
