import '../models/MovieListModel.dart';

abstract class BrowseRemoteDS{
 Future<MovieListModel> getMovieList(List<Genres>? genres);
}