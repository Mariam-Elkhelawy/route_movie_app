import 'package:dio/dio.dart';
import 'package:route_movie_app/core/utils/constants.dart';

import '../utils/app_strings.dart';

class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(
      {required String endPoint,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers}) {
    return dio.get('${Constants.baseURL}$endPoint?${AppStrings.apiKey}=${Constants.apiKey}',
        queryParameters: queryParameters,options: Options(
            headers: headers
        ));
  }

  postData(String endPoint, Map<String, dynamic>? data) {
    return dio.post(
      Constants.baseURL + endPoint,
      data: data,
    );
  }
}
