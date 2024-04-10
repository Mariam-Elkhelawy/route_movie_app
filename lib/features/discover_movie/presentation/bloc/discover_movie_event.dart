part of 'discover_movie_bloc.dart';

@immutable
abstract class DiscoverMovieEvent {}

class GetMovieDiscoverEvent extends DiscoverMovieEvent {
  int genreId;
  GetMovieDiscoverEvent(this.genreId);
}
