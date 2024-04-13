import 'package:route_movie_app/features/movie_details/data/data_sources/remote/more_like_remote_ds.dart';
import 'package:route_movie_app/features/movie_details/data/models/MoreLikeModel.dart';
import '../../../../../core/api/api_manager.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constants.dart';

class MoreLikeRemoteDsImplement implements MoreLikeRemoteDS {
  ApiManager apiManager = ApiManager();
  @override
  Future<MoreLikeModel> getMoreLikeMovie(int movieId) async {
    String endPointWithId = '/3/movie/$movieId/similar';
    var response = await apiManager.getData(
      endPoint: endPointWithId,
      headers: {
        AppStrings.authorization: Constants.apiToken,
      },
    );
    MoreLikeModel moreLikeModel = MoreLikeModel.fromJson(response.data);
    if (response.statusCode == 200) {
      return moreLikeModel;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
