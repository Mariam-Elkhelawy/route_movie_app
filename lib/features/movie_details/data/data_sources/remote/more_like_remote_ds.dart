import '../../models/MoreLikeModel.dart';

abstract class MoreLikeRemoteDS {
  Future<MoreLikeModel> getMoreLikeMovie(int movieId);
}
