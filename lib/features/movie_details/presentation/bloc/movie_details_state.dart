part of 'movie_details_bloc.dart';

class MovieDetailsState {
  ScreenStatus? status;
  MovieDetailsModel? movieDetailsModel;
  Failures? failures;
  MoreLikeModel? moreLikeModel;
  MovieDetailsState(
      {this.status, this.movieDetailsModel, this.failures, this.moreLikeModel});
  MovieDetailsState copyWith({
    ScreenStatus? status,
    MovieDetailsModel? movieDetailsModel,
    Failures? failures,
    MoreLikeModel? moreLikeModel,
  }) {
    return MovieDetailsState(
      status: status ?? this.status,
      movieDetailsModel: movieDetailsModel ?? this.movieDetailsModel,
      failures: failures ?? this.failures,
      moreLikeModel: moreLikeModel ?? this.moreLikeModel,
    );
  }
}

final class MovieDetailsInitialState extends MovieDetailsState {
  MovieDetailsInitialState()
      : super(
          status: ScreenStatus.initial,
        );
}
