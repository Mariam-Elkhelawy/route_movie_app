import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/config/routes/app_routes_names.dart';
import 'package:route_movie_app/core/enums/enums.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/app_strings.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import 'package:route_movie_app/features/home_tab/data/data_sources/remote/home_remote_ds_implement.dart';
import 'package:route_movie_app/features/home_tab/data/repositories/home_repo_implement.dart';
import 'package:route_movie_app/features/home_tab/domain/use_cases/get_popular_films_use_case.dart';
import 'package:route_movie_app/features/home_tab/domain/use_cases/get_recommended_usecase.dart';
import 'package:route_movie_app/features/home_tab/domain/use_cases/get_upcoming_films_usecase.dart';
import 'package:route_movie_app/features/home_tab/presentation/bloc/home_bloc.dart';
import 'package:route_movie_app/features/home_tab/presentation/widgets/new_relase_films.dart';
import 'package:route_movie_app/features/home_tab/presentation/widgets/popular_film_widget.dart';
import 'package:route_movie_app/features/home_tab/presentation/widgets/recommended_films.dart';
import 'package:route_movie_app/features/watchList_tab/data/models/watch_list_model.dart';

import '../../../../core/firebase/firebase_functions.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        GetPopularUseCase(
          HomeRepoImplementation(
            HomeRemoteDSImplementation(),
          ),
        ),
        GetUpComingUseCase(
          HomeRepoImplementation(
            HomeRemoteDSImplementation(),
          ),
        ),
        GetRecommendedUseCase(
          HomeRepoImplementation(
            HomeRemoteDSImplementation(),
          ),
        ),
      )
        ..add(
          HomePopularFilmEvent(),
        )
        ..add(HomeUpComingFilmEvent())
        ..add(HomeRecommendedFilmEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        // if (state.screenStatus == ScreenStatus.loading) {
        //   showDialog(
        //     context: context,
        //     builder: (context) {
        //       return const AlertDialog(
        //         title: Center(
        //           child: CircularProgressIndicator(
        //             color: AppColor.primaryColor,
        //           ),
        //         ),
        //       );
        //     },
        //   );
        // }
        // else if (state.screenStatus == ScreenStatus.success) {
        //    BlocProvider.of<HomeBloc>(context).add(HomePopularFilmEvent());
        // }
        if (state.screenStatus == ScreenStatus.failure) {
          showDialog(
            context: context,
            builder: (context) {
              print(state.failures?.message);
              return AlertDialog(
                title: const Text(AppStrings.error),
                content: Text(state.failures?.message ?? ""),
              );
            },
          );
        }
      }, builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: state.popularFilmModel?.results?.length ?? 0,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutesNames.movieDetails,
                            arguments:
                                state.popularFilmModel?.results?[itemIndex].id);
                      },
                      child: PopularFilmWidget(
                        imageBackdropPath:
                            '${Constants.imagePath}${state.popularFilmModel?.results?[itemIndex].backdropPath ?? ''}',
                        imagePosterPath:
                            '${Constants.imagePath}${state.popularFilmModel?.results?[itemIndex].posterPath ?? ''} ',
                        filmDate: state.popularFilmModel?.results?[itemIndex]
                                .releaseDate ??
                            '',
                        filmTitle:
                            state.popularFilmModel?.results?[itemIndex].title ??
                                '',
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    // autoPlayCurve: Curves.easeInBack,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 85.h),
                  child: Container(
                    width: double.infinity,
                    height: 187.h,
                    color: AppColor.moviesContainerBgColor,
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    padding:
                        EdgeInsets.only(left: 16.w, top: 8.h, bottom: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.newReleases,
                          style: AppStyles.bodyMedium.copyWith(fontSize: 15.sp),
                        ),
                        SizedBox(height: 12.h),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoutesNames.movieDetails,
                                      arguments: state.upComingFilmModel
                                          ?.results?[index].id);
                                },
                                child: NewReleasesFilms(
                                  onTap: () {
                                    WatchListModel model = WatchListModel(
                                        isWatchList: true,
                                        id:
                                            '${state.upComingFilmModel?.results?[index].id ?? 0}',
                                        title: state.upComingFilmModel
                                                ?.results?[index].title ??
                                            '',
                                        image:
                                            '${Constants.imagePath}${state.upComingFilmModel?.results?[index].backdropPath ?? ''} ',
                                        description: state.upComingFilmModel
                                                ?.results?[index].overview ??
                                            '',
                                        releaseDate: state.upComingFilmModel
                                                ?.results?[index].releaseDate ??
                                            '',
                                        movieId: state.upComingFilmModel
                                                ?.results?[index].id ??
                                            0);
                                    FirebaseFunctions.addWatchList(model);
                                  },
                                  filmImage:
                                      '${Constants.imagePath}${state.upComingFilmModel?.results?[index].posterPath ?? ''} ',
                                ),
                              );
                            },
                            itemCount:
                                state.upComingFilmModel?.results?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 12.w,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 246.h,
                  color: AppColor.moviesContainerBgColor,
                  margin: EdgeInsets.symmetric(vertical: 12.h),
                  padding: EdgeInsets.only(left: 16.w, top: 8.h, bottom: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.recommended,
                        style: AppStyles.bodyMedium.copyWith(fontSize: 15.sp),
                      ),
                      SizedBox(height: 10.h),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutesNames.movieDetails,
                                    arguments: state.recommendedFilmModel
                                        ?.results?[index].id);
                              },
                              child: RecommendedFilms(
                                filmImage:
                                    '${Constants.imagePath}${state.recommendedFilmModel?.results?[index].posterPath ?? ''} ',
                                filmDate: state.recommendedFilmModel
                                        ?.results?[index].releaseDate ??
                                    '',
                                filmName: state.recommendedFilmModel
                                        ?.results?[index].title ??
                                    '',
                                filmRating:
                                    ' ${state.recommendedFilmModel?.results?[index].popularity ?? ''}',
                              ),
                            );
                          },
                          itemCount:
                              state.recommendedFilmModel?.results?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 12.w,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
