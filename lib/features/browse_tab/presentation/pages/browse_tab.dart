import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/config/routes/app_routes_names.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/utils/app_strings.dart';
import '../../data/remote/data_sources/browse_remote_ds_impl.dart';
import '../../data/remote/models/MovieListModel.dart';
import '../../data/repositories/browse_repo_impl.dart';
import '../../domain/use_cases/browse_use_case.dart';
import '../bloc/browse_bloc.dart';
import '../widgets/browse_category_item.dart';

class BrowseTab extends StatelessWidget {
  BrowseTab({super.key});

  List<Genres>? genres;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrowseBloc(
        BrowseUseCase(
          BrowseRepoImplement(
            BrowseRemoteDSImplement(),
          ),
        ),
      )..add(GetMovieListEvent()),
      child: BlocConsumer<BrowseBloc, BrowseState>(
        listener: (context, state) {

          /*if (state.status == ScreenStatus.loading) {

            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );

          } else if(state.status == ScreenStatus.success){

            BlocProvider.of<BrowseBloc>(context).add(GetMovieListEvent());
          }*/
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
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 70.h,
                ),
                Text(
                  "Browse Category",
                  style: AppStyles.bodyLarge,
                ),
                Expanded(
                  child: GridView.builder(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 5.h),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 30, // spacing between rows
                      crossAxisSpacing: 40,
                      childAspectRatio: 1.7 / 1,
                    ),
                    itemBuilder: (context, index) => BrowseCategoryItem(
                      genres: state.movieList!.genres![index],
                      text: state.movieList!.genres?[index].name ?? "unknown",
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutesNames.discoverMovie,
                          arguments: Map<String, dynamic>.from({
                            "genreName": state.movieList!.genres![index].name,
                            "genreId": state.movieList!.genres![index].id
                          })

                        );


                      },
                    ),

                    itemCount: BlocProvider.of<BrowseBloc>(context)
                            .state
                            .movieList
                            ?.genres
                            ?.length ??
                        0,

                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}