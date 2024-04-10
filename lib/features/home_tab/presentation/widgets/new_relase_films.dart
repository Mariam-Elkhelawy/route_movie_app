import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';

class NewReleasesFilms extends StatefulWidget {
  NewReleasesFilms({super.key, required this.filmImage});
  String filmImage;

  @override
  State<NewReleasesFilms> createState() => _NewReleasesFilmsState();
}

class _NewReleasesFilmsState extends State<NewReleasesFilms> {
  bool watchlist = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: CachedNetworkImage(
            imageUrl: widget.filmImage,
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
        InkWell(
          onTap: () {
            watchlist = true;
            setState(() {});
          },
          child: watchlist
              ? Image.asset(
                  'assets/images/ic_watchList_bookmark.png',
                  width: 27.w,
                  height: 36.h,
                )
              : Image.asset(
                  'assets/images/ic_bookmark.png',
                  width: 27.w,
                  height: 36.h,
                ),
        ),
      ],
    );
  }
}
