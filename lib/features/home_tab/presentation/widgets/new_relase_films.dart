import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/components/reusable_components/isWatchList_widget.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/features/watchList_tab/data/models/watch_list_model.dart';

class NewReleasesFilms extends StatefulWidget {
  NewReleasesFilms(
      {super.key,
      required this.filmImage,
      required this.onTap,
        required this.watchListModel,
       this.isWatchList});
  String filmImage;
  VoidCallback onTap;
  WatchListModel watchListModel;
  bool? isWatchList;

  @override
  State<NewReleasesFilms> createState() => _NewReleasesFilmsState();
}

class _NewReleasesFilmsState extends State<NewReleasesFilms> {
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
        Positioned(
          left: -1,
          child: InkWell(
            onTap: () {
              widget.onTap();
              // showDialog(
              //   context: context,
              //   builder: (context) => AlertDialog(
              //     content: const Text('Film Added To WatchList'),
              //     actions: [

              //       ElevatedButton(
              //           onPressed: () {
              //             Navigator.pop(context);
              //           },
              //           child: const Text('OK'),)
              //     ],
              //   ),
              // );
            },
            child: IsWatchList(watchListModel: widget.watchListModel),
          ),
        ),
      ],
    );
  }
}
