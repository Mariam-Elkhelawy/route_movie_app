part of 'discover_movie_bloc.dart';

abstract class DiscoverMovieEvent {}

class GetMovieDiscoverEvent extends DiscoverMovieEvent {
  int genreId;
  GetMovieDiscoverEvent(this.genreId);
}
