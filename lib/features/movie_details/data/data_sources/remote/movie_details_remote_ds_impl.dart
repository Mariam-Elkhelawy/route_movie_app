import 'package:route_movie_app/core/api/end_points.dart';
import 'package:route_movie_app/features/movie_details/data/data_sources/remote/movie_details_remote_ds.dart';
import 'package:route_movie_app/features/movie_details/data/models/MovieDetailsModel.dart';
import '../../../../../core/api/api_manager.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constants.dart';

class MovieDetailsRemoteDSImpl implements MovieDetailsRemoteDS {
  ApiManager apiManager = ApiManager();
  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    String endPointWithId = '${EndPoints.details}/$movieId';
    var response = await apiManager.getData(
      endPoint: endPointWithId,
      headers: {
        AppStrings.authorization: Constants.apiToken,
      },
    );
    MovieDetailsModel movieDetailsModel =
        MovieDetailsModel.fromJson(response.data);
    if (response.statusCode == 200) {
      return movieDetailsModel;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
