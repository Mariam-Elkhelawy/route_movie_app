import '../../models/MovieDiscoverModel.dart';

abstract class DiscoverMovieRemoteDS {
  Future<MovieDiscoverModel> getMovieDiscoverList(int genreId);
}
