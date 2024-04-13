import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import 'package:route_movie_app/features/watchList_tab/data/models/watch_list_model.dart';

import '../../../../config/routes/app_routes_names.dart';
import '../../../../core/utils/app_colors.dart';

class WatchListItem extends StatelessWidget {
  WatchListItem({super.key, required this.watchListModel});
  WatchListModel watchListModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 8.w),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutesNames.movieDetails,
                    arguments: watchListModel.movieId);
              },
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: CachedNetworkImage(
                          imageUrl: watchListModel.image,
                          fit: BoxFit.cover,
                          width: 140.w,
                          height: 95.h,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      if (watchListModel.isWatchList)
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/ic_watchList_bookmark.png',
                            width: 27.w,
                            height: 36.h,
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 215.w,

                          child: Text(

                            watchListModel.title,
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                            style: AppStyles.bodyMedium.copyWith(fontSize: 15.sp),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(watchListModel.releaseDate,
                            style: AppStyles.bodySmall),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 215.w,
                          child: Text(watchListModel.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: AppStyles.bodySmall),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: Color(0xFF707070),
          )
        ],
      ),
    );
  }
}
