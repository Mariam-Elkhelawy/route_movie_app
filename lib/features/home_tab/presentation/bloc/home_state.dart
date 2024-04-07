part of 'home_bloc.dart';

class HomeState {
  ScreenStatus? screenStatus;
  PopularFilmModel? popularFilmModel;
  Failures? failures;

  HomeState({this.screenStatus, this.popularFilmModel, this.failures});
  HomeState copyWith(
      {ScreenStatus? screenStatus,
      PopularFilmModel? popularFilmModel,
      Failures? failures}) {
    return HomeState(
        screenStatus: screenStatus ?? this.screenStatus,
        popularFilmModel: popularFilmModel ?? this.popularFilmModel,
        failures: failures ?? this.failures);
  }
}

final class HomeInitialState extends HomeState {
  HomeInitialState() : super(screenStatus: ScreenStatus.initial);
}
