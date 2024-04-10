part of 'home_bloc.dart';

class HomeState {
  ScreenStatus? screenStatus;
  PopularFilmModel? popularFilmModel;
  Failures? failures;
  UpComingFilmModel? upComingFilmModel;
  RecommendedFilmModel? recommendedFilmModel;

  HomeState(
      {this.screenStatus,
      this.popularFilmModel,
      this.failures,
      this.upComingFilmModel,
      this.recommendedFilmModel});
  HomeState copyWith(
      {ScreenStatus? screenStatus,
      PopularFilmModel? popularFilmModel,
      Failures? failures,
      UpComingFilmModel? upComingFilmModel,
      RecommendedFilmModel? recommendedFilmModel}) {
    return HomeState(
        screenStatus: screenStatus ?? this.screenStatus,
        popularFilmModel: popularFilmModel ?? this.popularFilmModel,
        failures: failures ?? this.failures,
        upComingFilmModel: upComingFilmModel ?? this.upComingFilmModel,
        recommendedFilmModel:
            recommendedFilmModel ?? this.recommendedFilmModel);
  }
}

final class HomeInitialState extends HomeState {
  HomeInitialState() : super(screenStatus: ScreenStatus.initial);
}
