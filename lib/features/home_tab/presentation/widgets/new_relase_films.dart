import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/components/reusable_components/isWatchList_widget.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/features/watchList_tab/data/models/watch_list_model.dart';

class NewReleasesFilms extends StatelessWidget {
  const NewReleasesFilms(
      {super.key,
      required this.filmImage,
      required this.onTap,
      required this.isWatchList});
  final String filmImage;
  final VoidCallback onTap;
  final bool isWatchList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: CachedNetworkImage(
            imageUrl: filmImage,
            fit: BoxFit.cover,
            width: 97.w,
            height: 128.h,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: AppColor.primaryColor,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          left: -1,
          child: InkWell(
            onTap: () {
              onTap();
            },
            child: IsWatchList(
              isWatchList: isWatchList,
            ),
          ),
        ),
      ],
    );
  }
}
