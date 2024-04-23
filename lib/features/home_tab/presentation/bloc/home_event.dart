part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomePopularFilmEvent extends HomeEvent {}

class HomeUpComingFilmEvent extends HomeEvent {}
class HomeRecommendedFilmEvent extends HomeEvent {}
class UpdateWatchlistStatusEvent extends HomeEvent {
  final int movieId;

  UpdateWatchlistStatusEvent({required this.movieId});

  List<Object?> get props => [movieId];
}
