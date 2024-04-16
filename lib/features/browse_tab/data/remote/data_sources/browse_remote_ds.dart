import '../models/MovieListModel.dart';

abstract class BrowseRemoteDS {
  Future<MovieListModel> getMovieList();
}
