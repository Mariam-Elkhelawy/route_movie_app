import 'package:dio/dio.dart';
import 'package:route_movie_app/core/utils/constants.dart';

class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(
      String endPoint, Map<String, dynamic>? queryParameters) {
    return dio.get(Constants.baseURL + endPoint,
        queryParameters: queryParameters);
  }

  postData(String endPoint, Map<String, dynamic>? data) {
    return dio.post(
      Constants.baseURL + endPoint,
      data: data,
    );
  }
}
