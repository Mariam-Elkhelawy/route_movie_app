import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/remote/models/MovieListModel.dart';

class BrowseCategoryItem extends StatelessWidget {
  const  BrowseCategoryItem({super.key, required this.genres, required this.text});
 final Genres? genres;
 final String text;
  @override
  Widget build(BuildContext context) {
        return Stack(
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
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        );

  }
}
