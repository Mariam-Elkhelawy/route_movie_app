import 'package:dio/dio.dart';
import 'package:route_movie_app/core/api/api_manager.dart';
import 'package:route_movie_app/core/api/end_points.dart';
import 'package:route_movie_app/features/home_tab/data/data_sources/remote/home_remote_ds.dart';
import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';

class HomeRemoteDSImplementation implements HomeRemoteDS {
  @override
  Future<PopularFilmModel> slideFilm(PopularFilmModel popularFilm) async {
    ApiManager apiManager = ApiManager();
    Response response =
        await apiManager.getData(EndPoints.popular, popularFilm.toJson());
    PopularFilmModel popularFilmModel =
        PopularFilmModel.fromJson(response.data);
    return popularFilmModel;
  }
}
