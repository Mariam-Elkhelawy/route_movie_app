import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/config/routes/app_routes_names.dart';
import 'package:route_movie_app/core/enums/enums.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/app_strings.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import 'package:route_movie_app/features/search_tab/data/data_sources/remote/search_remote_ds_imlement.dart';
import 'package:route_movie_app/features/search_tab/data/repositories/search_repo_implement.dart';
import 'package:route_movie_app/features/search_tab/domain/use_cases/search_use_case.dart';
import 'package:route_movie_app/features/search_tab/presentation/bloc/search_bloc.dart';
import 'package:route_movie_app/features/search_tab/presentation/widgets/custom_search_widget.dart';
import 'package:route_movie_app/features/search_tab/presentation/widgets/custom_text_field.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchController = TextEditingController();

  String searchKey = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        SearchUseCase(
          SearchRepoImplementation(
            SearchRemoteDSImplementation(),
          ),
        ),
      )..add(SearchFilmEvent(searchKey)),
      child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          // if (state.screenStatus == ScreenStatus.loading) {
          //   showDialog(
          //     context: context,
          //     barrierDismissible: false,
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
          if (state.screenStatus == ScreenStatus.success) {}
          if (state.screenStatus == ScreenStatus.failure) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(AppStrings.error),
                  content: Text(state.failures?.message ?? ""),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  CustomTextField(
                    onChanged: (String value) {
                      searchKey = value;
                      BlocProvider.of<SearchBloc>(context)
                          .add(SearchFilmEvent(searchKey));
                    },
                    searchController: searchController,
                  ),
                  if (searchKey == '') ...[
                    SizedBox(height: 250.h),
                    Image.asset('assets/images/no_movie.png'),
                    SizedBox(height: 10.h),
                    Text(
                      AppStrings.noMovie,
                      style: AppStyles.bodyMedium,
                    ),
                  ],
                  if (searchKey != '') ...[
                    SizedBox(height: 25.h),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutesNames.movieDetails,
                                  arguments: state.searchFilmModel
                                          ?.results?[index].id ??
                                      0);
                            },
                            child: CustomSearchWidget(
                              filmImage:
                                  '${Constants.imagePath}${state.searchFilmModel?.results?[index].posterPath ?? ''} ',
                              filmName: state
                                      .searchFilmModel?.results?[index].title ??
                                  '',
                              filmOverView: state.searchFilmModel
                                      ?.results?[index].originalTitle ??
                                  '',
                              filmYear: state.searchFilmModel?.results?[index]
                                      .releaseDate ??
                                  '',
                            ),
                          );
                        },
                        itemCount: state.searchFilmModel?.results?.length,
                      ),

                    ),
                    SizedBox(height: 16.h)

                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
