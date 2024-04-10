import 'package:dio/dio.dart';
import 'package:route_movie_app/core/api/api_manager.dart';
import 'package:route_movie_app/core/api/end_points.dart';
import 'package:route_movie_app/core/utils/constants.dart';
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
          "Authorization": Constants.apiToken,
          "accept": "application/json"

        });
    SearchFilmModel searchFilmModel = SearchFilmModel.fromJson(response.data);
    return searchFilmModel;
  }
}
