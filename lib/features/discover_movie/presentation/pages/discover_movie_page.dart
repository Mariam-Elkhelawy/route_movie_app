import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import 'package:route_movie_app/features/discover_movie/data/data_sources/remote/discover_movie_ds_impl.dart';
import 'package:route_movie_app/features/discover_movie/data/repositories/discover_movie_repo_impl.dart';
import 'package:route_movie_app/features/discover_movie/domain/use_cases/discover_movie_use_case.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constants.dart';
import '../bloc/discover_movie_bloc.dart';

class DiscoverMoviePage extends StatelessWidget {
  const DiscoverMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String genreName = args['genreName'] as String;
    final int genreId = args['genreId'] as int ;
    return BlocProvider(
      create: (context) => DiscoverMovieBloc(
        DiscoverMovieUseCase(
          DiscoverMovieRepoImplement(
            DiscoverMovieRemoteDSImplement(),
          ),
        ),
      )..add(GetMovieDiscoverEvent(genreId)),
      child: BlocConsumer<DiscoverMovieBloc, DiscoverMovieState>(
  listener: (context, state) {
   /* if (state.status == ScreenStatus.loading) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }*/
     if(state.status == ScreenStatus.success){
    BlocProvider.of<DiscoverMovieBloc>(context).add(GetMovieDiscoverEvent(genreId));
    }
    if (state.status == ScreenStatus.failure) {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: AlertDialog(
            title: const Text(AppStrings.error),
            content: Text(
              state.failures?.message ?? AppStrings.wrong,
            ),
          ),
        ),
      );
    }
  },
  builder: (context, state) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            genreName,
            style: AppStyles.titleAppBar,
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 10.h,),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 1.5 / 2,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5.h),
                  child: CachedNetworkImage(
                    imageUrl: '${Constants.imagePath}${state.movieDiscoverModel!.results?[index].posterPath ?? "" }',
                    fit: BoxFit.fill,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: AppColor.primaryColor,
                          ),
                        ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                );
              /*  return Text(state.movieDiscoverModel!.results?[index].title ??"", style: AppStyles.titleAppBar,);*/
              },
              itemCount: BlocProvider.of<DiscoverMovieBloc>(context).state.movieDiscoverModel?.results?.length ?? 0,

            ),
          ],
        ),
      );
  },
),
    );
  }
}
