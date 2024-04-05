import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/app_images.dart';
import 'package:route_movie_app/core/utils/app_strings.dart';
import 'package:route_movie_app/features/browse_tab/presentation/pages/browse_tab.dart';
import 'package:route_movie_app/features/home_tab/presentation/pages/home_tab.dart';
import 'package:route_movie_app/features/search_tab/presentation/pages/search_tab.dart';
import 'package:route_movie_app/features/watchList_tab/presentation/pages/WatchList_tab.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.53),
              blurRadius: 6,
              offset: const Offset(0, -6),
            )
          ],
        ),
        height: 66.h,
        child: BottomNavigationBar(
          iconSize: 28,
          selectedFontSize: 8.sp,
          unselectedFontSize: 8.sp,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                activeIcon: GradientIcon(
                  icon: ImageIcon(
                    AssetImage(AppImages.icHome),
                  ),
                ),
                icon: ImageIcon(
                  AssetImage(AppImages.icHome),
                ),
                label: AppStrings.home),
            BottomNavigationBarItem(
                activeIcon: GradientIcon(
                  icon: ImageIcon(
                    AssetImage(AppImages.icSearch),
                  ),
                ),
                icon: ImageIcon(
                  AssetImage(AppImages.icSearch),
                ),
                label: AppStrings.search),
            BottomNavigationBarItem(
                activeIcon: GradientIcon(
                  icon: ImageIcon(
                    AssetImage(AppImages.icBrowse),
                  ),
                ),
                icon: ImageIcon(
                  AssetImage(AppImages.icBrowse),
                ),
                label: AppStrings.browse),
            BottomNavigationBarItem(
                activeIcon: GradientIcon(
                  icon: ImageIcon(
                    AssetImage(AppImages.icWatchList),
                  ),
                ),
                icon: ImageIcon(
                  AssetImage(AppImages.icWatchList),
                ),
                label: AppStrings.watchList),
          ],
        ),
      ),
      body: screens[index],
    );
  }
}

List<Widget> screens = [
  const HomeTab(),
  const SearchTab(),
  const BrowseTab(),
  const WatchListTab()
];

class GradientIcon extends StatelessWidget {
  final ImageIcon icon;

  const GradientIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [AppColor.primaryColor, AppColor.primaryLinearColor],
        ).createShader(bounds);
      },
      child: icon,
    );
  }
}
