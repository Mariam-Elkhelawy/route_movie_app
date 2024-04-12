part of 'movie_details_bloc.dart';

class MovieDetailsState {
  ScreenStatus? status;
  MovieDetailsModel? movieDetailsModel;
  Failures? failures;
  MovieDetailsState({this.status, this.movieDetailsModel, this.failures});
  MovieDetailsState copyWith(
      {ScreenStatus? status,
      MovieDetailsModel? movieDetailsModel,
      Failures? failures}) {
    return MovieDetailsState(
      status: status ?? this.status,
      movieDetailsModel: movieDetailsModel ?? this.movieDetailsModel,
      failures: failures ?? this.failures,
    );
  }
}

final class MovieDetailsInitialState extends MovieDetailsState {
  MovieDetailsInitialState()
      : super(
          status: ScreenStatus.initial,
        );
}
