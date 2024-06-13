import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/config/routes/app_routes_names.dart';
import 'package:route_movie_app/core/components/reusable_components/isWatchList_widget.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import '../../data/models/PopularFilmModel.dart';

class NewReleasesFilms extends StatelessWidget {
  const NewReleasesFilms(
      {super.key,
      required this.onTap,
      required this.movie,
      required this.isWatchList});
  final VoidCallback onTap;
  final bool isWatchList;
  final Results movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesNames.movieDetails,
            arguments: Map<String, dynamic>.from({
              "filmId": movie.id ?? 0,
              "isWatchList": isWatchList,
            }));
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: CachedNetworkImage(
              imageUrl:
                  '${Constants.imagePath}${movie.posterPath ?? '${Constants.imagePath}/j3Z3XktmWB1VhsS8iXNcrR86PXi.jpg'} ',
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
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported_outlined),
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
      ),
    );
  }
}
