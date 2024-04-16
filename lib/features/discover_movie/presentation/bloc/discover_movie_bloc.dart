import 'package:bloc/bloc.dart';
import 'package:route_movie_app/features/discover_movie/data/models/MovieDiscoverModel.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/use_cases/discover_movie_use_case.dart';

part 'discover_movie_event.dart';
part 'discover_movie_state.dart';

class DiscoverMovieBloc extends Bloc<DiscoverMovieEvent, DiscoverMovieState> {
  DiscoverMovieUseCase discoverMovieUseCase;
  DiscoverMovieBloc(this.discoverMovieUseCase)
      : super(DiscoverMovieInitialState()) {
    on<GetMovieDiscoverEvent>((event, emit) async {
      emit(state.copyWith(status: ScreenStatus.loading));
      var result = await discoverMovieUseCase.call(event.genreId);
      result.fold((l) {
        emit(state.copyWith(status: ScreenStatus.failure, failures: l));
      }, (r) {
        emit(state.copyWith(
            status: ScreenStatus.success, movieDiscoverModel: r));
      });
    });
  }
}
