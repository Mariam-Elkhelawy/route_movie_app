import 'package:dio/dio.dart';
import 'package:route_movie_app/core/api/api_manager.dart';
import 'package:route_movie_app/core/api/end_points.dart';
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
        "Authorization": Constants.apiToken,
        "accept": "application/json"
      },
    );

    PopularFilmModel popularFilmModel =
        PopularFilmModel.fromJson(response.data);
    return popularFilmModel;
  }

  @override
  Future<UpComingFilmModel> getUpComingFilms() async {
    Response response = await apiManager.getData(
      endPoint: EndPoints.newRelease,
      headers: {
        "Authorization": Constants.apiToken,
        "accept": "application/json"
      },
    );
    UpComingFilmModel upComingFilmModel =
        UpComingFilmModel.fromJson(response.data);
    return upComingFilmModel;
  }

  @override
  Future<RecommendedFilmModel> getRecommendedFilms() async {
    Response response = await apiManager.getData(
      endPoint: EndPoints.recommended,
      headers: {
        "Authorization": Constants.apiToken,
        "accept": "application/json"
      },
    );
    RecommendedFilmModel recommendedFilmModel =
        RecommendedFilmModel.fromJson(response.data);
    return recommendedFilmModel;
  }
}
