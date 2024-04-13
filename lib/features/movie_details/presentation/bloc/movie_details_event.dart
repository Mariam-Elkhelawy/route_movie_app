part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  int movieId;
  GetMovieDetailsEvent(this.movieId);
}
class MoreLikeMovieEvent extends MovieDetailsEvent {
  int movieId;
  MoreLikeMovieEvent(this.movieId);
}
