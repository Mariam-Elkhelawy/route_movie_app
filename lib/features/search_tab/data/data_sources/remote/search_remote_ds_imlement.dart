import 'package:dio/dio.dart';
import 'package:route_movie_app/core/api/api_manager.dart';
import 'package:route_movie_app/core/api/end_points.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/features/search_tab/data/data_sources/remote/search_remote_ds.dart';
import 'package:route_movie_app/features/search_tab/data/models/SearchFilmModel.dart';

class SearchRemoteDSImplementation implements SearchRemoteDs {
  @override
  Future<SearchFilmModel> getSearchFilms(String searchQuery) async {

    try {
      final apiManager = ApiManager();
      final response = await apiManager.getData(
        endPoint: EndPoints.search,
        queryParameters: {'query': searchQuery},
        headers: {"Authorization": Constants.apiToken},
      );
      if (response.statusCode == 200) {
        return SearchFilmModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load films: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load films: $e');
    }
}
