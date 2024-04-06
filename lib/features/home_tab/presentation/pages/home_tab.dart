import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/constants.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import 'package:route_movie_app/features/home_tab/data/models/PopularFilmModel.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        CarouselSlider.builder(
          itemCount: 15,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            Results model = Results();
            return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Image.asset(
                  '${Constants.imagePath}${model.backdropPath}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 217.h,
                ),
                const Icon(
                  Icons.play_circle,
                  color: Colors.white,
                  size: 60,
                ),
                Positioned(
                  top: 92.h,
                  left: 18.w,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            '${Constants.imagePath}${model.posterPath}',
                            width: 129.w,
                            height: 199.h,
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     watchlist = true;
                          //   },
                          //   child: watchlist
                          //       ? Image.asset(
                          //     'assets/images/ic_watchList_bookmark.png',
                          //     width: 27.w,
                          //     height: 36.h,
                          //   )
                          //       : Image.asset(
                          //     'assets/images/ic_bookmark.png',
                          //     width: 27.w,
                          //     height: 36.h,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 108.h),
                          Text(
                            model.title??'',
                            style:
                                AppStyles.bodyLarge.copyWith(fontSize: 14.sp),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            model.releaseDate??'',
                            style: AppStyles.bodyMedium.copyWith(
                                color: const Color(0xFFB5B4B4), fontSize: 10.sp),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.easeInBack,
          ),
        )
      ],
    );
  }
}
