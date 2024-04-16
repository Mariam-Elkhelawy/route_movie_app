part of 'discover_movie_bloc.dart';

class DiscoverMovieState {
  ScreenStatus? status;
  MovieDiscoverModel? movieDiscoverModel;
  Failures? failures;
  DiscoverMovieState({this.status, this.movieDiscoverModel, this.failures});
  DiscoverMovieState copyWith(
      {ScreenStatus? status,
      MovieDiscoverModel? movieDiscoverModel,
      Failures? failures}) {
    return DiscoverMovieState(
      status: status ?? this.status,
      movieDiscoverModel: movieDiscoverModel ?? this.movieDiscoverModel,
      failures: failures ?? this.failures,
    );
  }
}

class DiscoverMovieInitialState extends DiscoverMovieState {
  DiscoverMovieInitialState()
      : super(
          status: ScreenStatus.initial,
        );
}
