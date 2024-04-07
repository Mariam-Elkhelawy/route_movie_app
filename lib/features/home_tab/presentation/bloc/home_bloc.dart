import 'package:bloc/bloc.dart';
import 'package:route_movie_app/core/enums/enums.dart';
import 'package:route_movie_app/core/errors/failures.dart';
import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';
import 'package:route_movie_app/features/home_tab/domain/use_cases/get_popular_films_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetPopularUseCase getPopularUseCase;
  HomeBloc(this.getPopularUseCase) : super(HomeInitialState()) {
    on<HomePopularFilmEvent>((event, emit) async {
      emit(state.copyWith(screenStatus: ScreenStatus.loading));
      var result = await getPopularUseCase.call();
      result.fold((l) {
        emit(state.copyWith(screenStatus: ScreenStatus.failure, failures: l));

      }, (r) {
        emit(state.copyWith(screenStatus: ScreenStatus.success,popularFilmModel: r));
      });
    },);
  }
}
