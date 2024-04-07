import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/enums/enums.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/app_strings.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import 'package:route_movie_app/features/home_tab/data/data_sources/remote/home_remote_ds_implement.dart';
import 'package:route_movie_app/features/home_tab/data/repositories/home_repo_implement.dart';
import 'package:route_movie_app/features/home_tab/domain/use_cases/get_popular_films_use_case.dart';
import 'package:route_movie_app/features/home_tab/presentation/bloc/home_bloc.dart';

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
      )..add(HomePopularFilmEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        if (state.screenStatus == ScreenStatus.loading) {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                ),
              );
            },
          );
        } else if (state.screenStatus == ScreenStatus.success) {
          BlocProvider.of<HomeBloc>(context).add(HomePopularFilmEvent());
        } else if (state.screenStatus == ScreenStatus.failure) {
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
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: state.popularFilmModel?.results?.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  print(itemIndex);
                  print(pageViewIndex);
                  return Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        '${Constants.imagePath}${state.popularFilmModel?.results?[itemIndex].backdropPath ?? ''}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 217.h,
                      ),
                      const Icon(
                        Icons.play_circle,
                        color: Colors.white,
                        size: 60,
                      ),
                      Positioned(
                        top: 92.h,
                        left: 18.w,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  '${Constants.imagePath}${state.popularFilmModel?.results?[itemIndex].posterPath}',
                                  width: 129.w,
                                  height: 199.h,
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     watchlist = true;
                                //   },
                                //   child: watchlist
                                //       ? Image.asset(
                                //     'assets/images/ic_watchList_bookmark.png',
                                //     width: 27.w,
                                //     height: 36.h,
                                //   )
                                //       : Image.asset(
                                //     'assets/images/ic_bookmark.png',
                                //     width: 27.w,
                                //     height: 36.h,
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 108.h),
                                Text(
                                  state.popularFilmModel?.results?[itemIndex]
                                          .title ??
                                      '',
                                  style: AppStyles.bodyLarge
                                      .copyWith(fontSize: 14.sp),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  state
                                          .popularFilmModel
                                          ?.results?[pageViewIndex]
                                          .releaseDate ??
                                      '',
                                  style: AppStyles.bodyMedium.copyWith(
                                      color: const Color(0xFFB5B4B4),
                                      fontSize: 10.sp),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.easeInBack,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
