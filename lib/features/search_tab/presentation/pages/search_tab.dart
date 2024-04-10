import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/enums/enums.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/app_strings.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import 'package:route_movie_app/features/search_tab/data/data_sources/remote/search_remote_ds_imlement.dart';
import 'package:route_movie_app/features/search_tab/data/repositories/search_repo_implement.dart';
import 'package:route_movie_app/features/search_tab/domain/use_cases/search_use_case.dart';
import 'package:route_movie_app/features/search_tab/presentation/bloc/search_bloc.dart';
import 'package:route_movie_app/features/search_tab/presentation/widgets/custom_watchlist.dart';

class SearchTab extends StatefulWidget {
  SearchTab({super.key});

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
      )..add(SearchFilmEvent( searchKey)),
      child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
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
           if (state.screenStatus == ScreenStatus.success) {
            BlocProvider.of<SearchBloc>(context).add(SearchFilmEvent(searchKey));
            ListView.builder(
              itemBuilder: (context, index) {
                CustomWatchList(
                  isWatchList: false,
                  filmImage:
                      '${Constants.imagePath}${state.searchFilmModel?.results?[index].posterPath}',
                  filmName: state.searchFilmModel?.results?[index].title ?? '',
                  filmOverView:
                      state.searchFilmModel?.results?[index].originalTitle ??
                          '',
                  filmYear:
                      state.searchFilmModel?.results?[index].releaseDate ?? '',
                );
              },
              itemCount: state.searchFilmModel?.results?.length,
            );
          }
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
                  TextFormField(
                      onChanged: (String? value) {
                        searchKey = value ?? '';
                        setState(() {});
                      },
                    controller: searchController,
                    style: AppStyles.bodyMedium,
                    cursorColor: const Color(0xFF48CFAD),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding: EdgeInsets.all(14.r),
                      hintStyle: AppStyles.bodyMedium.copyWith(
                        color: AppColor.whiteColor.withOpacity(.46),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 4.0.r),
                        child: IconButton(
                          onPressed: () {},
                          icon: const ImageIcon(
                            AssetImage('assets/images/ic_textField.png'),
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF514F4F).withOpacity(.58),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: const BorderSide(
                            color: AppColor.whiteColor, width: .5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: const BorderSide(
                            color: AppColor.whiteColor, width: .5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: const BorderSide(
                            color: AppColor.whiteColor, width: .5),
                      ),
                    ),
                  ),
                  if ( searchKey == '') ...[
                    SizedBox(height: 250.h),
                    Image.asset('assets/images/no_movie.png'),
                    SizedBox(height: 10.h),
                    Text(
                      AppStrings.noMovie,
                      style: AppStyles.bodyMedium,
                    ),
                  ],
                  if ( searchKey != '') ...[
                    ListView.builder(
                      itemBuilder: (context, index) {
                        CustomWatchList(
                          isWatchList: false,
                          filmImage:
                              '${Constants.imagePath}${state.searchFilmModel?.results?[index].posterPath ?? ''} ',
                          filmName:
                              state.searchFilmModel?.results?[index].title ??
                                  '',
                          filmOverView: state.searchFilmModel?.results?[index]
                                  .originalTitle ??
                              '',
                          filmYear: state.searchFilmModel?.results?[index]
                                  .releaseDate ??
                              '',
                        );
                      },
                      itemCount: state.searchFilmModel?.results?.length,
                    )
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
