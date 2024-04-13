import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/app_images.dart';
import 'package:route_movie_app/features/watchList_tab/data/models/watch_list_model.dart';

class IsWatchList extends StatelessWidget {
   IsWatchList({super.key, this.isWatchList,required this.watchListModel});
bool? isWatchList ;
WatchListModel watchListModel;
  @override
  Widget build(BuildContext context) {
    return watchListModel.isWatchList
        ? Image.asset(
      AppImages.icWatchListBookmark,
      width: 27.w,
      height: 36.h,
    )
        : Image.asset(
      AppImages.icBookmark,
      width: 27.w,
      height: 36.h,
    );
      isWatchList??false
        ? Image.asset(
      AppImages.icWatchListBookmark,
      width: 27.w,
      height: 36.h,
    )
        : Image.asset(
      AppImages.icBookmark,
      width: 27.w,
      height: 36.h,
    );
  }
}
