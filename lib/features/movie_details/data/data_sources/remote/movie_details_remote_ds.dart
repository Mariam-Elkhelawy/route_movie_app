import '../../models/MovieDetailsModel.dart';

abstract class MovieDetailsRemoteDS {
  Future<MovieDetailsModel> getMovieDetails(int movieId);
}
