import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          child: InkWell(
            onTap: () {},
            child: Image.network(
              widget.filmImage,
              height: 128.h,
              width: 97.w,
            ),
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
