import 'package:dio/dio.dart';
import 'package:route_movie_app/core/api/api_manager.dart';
import 'package:route_movie_app/core/api/end_points.dart';
import 'package:route_movie_app/core/utils/app_strings.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/features/home_tab/data/data_sources/remote/home_remote_ds.dart';
import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';
import 'package:route_movie_app/features/home_tab/data/models/RecommendedFilmModel.dart';
import 'package:route_movie_app/features/home_tab/data/models/UpComingFilmModel.dart';

class HomeRemoteDSImplementation implements HomeRemoteDS {
  ApiManager apiManager = ApiManager();

  @override
  Future<PopularFilmModel> getPopularFilms() async {
    Response response = await apiManager.getData(
      endPoint: EndPoints.popular,
      queryParameters: {'language': 'en-US'},
      headers: {
        AppStrings.authorization: Constants.apiToken,
        "accept": "application/json"
      },
    );
    PopularFilmModel popularFilmModel =
        PopularFilmModel.fromJson(response.data);
    if (response.statusCode == 200) {
      return popularFilmModel;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Future<UpComingFilmModel> getUpComingFilms() async {
    Response response = await apiManager.getData(
      endPoint: EndPoints.newRelease,
      headers: {
        AppStrings.authorization: Constants.apiToken,
        "accept": "application/json"
      },
    );
    UpComingFilmModel upComingFilmModel =
        UpComingFilmModel.fromJson(response.data);
    if (response.statusCode == 200) {
      return upComingFilmModel;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Future<RecommendedFilmModel> getRecommendedFilms() async {
    Response response = await apiManager.getData(
      endPoint: EndPoints.recommended,
      headers: {
        AppStrings.authorization: Constants.apiToken,
        "accept": "application/json"
      },
    );
    RecommendedFilmModel recommendedFilmModel =
        RecommendedFilmModel.fromJson(response.data);
    if (response.statusCode == 200) {
      return recommendedFilmModel;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
