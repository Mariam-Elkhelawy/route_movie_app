import 'package:flutter/material.dart';
import 'package:route_movie_app/config/routes/app_routes_names.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import 'package:route_movie_app/main.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/remote/models/MovieListModel.dart';

class BrowseCategoryItem extends StatelessWidget {
  const  BrowseCategoryItem({super.key, required this.genres, required this.text, required this.onTap});
 final Genres? genres;
 final String text;
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
        return InkWell(
          onTap: (){
            onTap();
          } ,
          child: Stack(
            children: [
              const Image(
                image: AssetImage(
                  'assets/images/cover_category_item.png',
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 158,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.movieItemBgColor.withOpacity(0.37),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.blackColor.withOpacity(0.16),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  text,
                  style: AppStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        );

  }
}
