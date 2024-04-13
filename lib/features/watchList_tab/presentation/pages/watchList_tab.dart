import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_movie_app/core/firebase/firebase_functions.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/app_strings.dart';
import 'package:route_movie_app/core/utils/styles.dart';
import 'package:route_movie_app/features/watchList_tab/presentation/widgets/watchlist_item.dart';

import '../../../search_tab/presentation/widgets/custom_watchlist.dart';
import '../../data/models/watch_list_model.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 25.h),
            Text(
              'Watchlist',
              style: AppStyles.bodyLarge,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10.h),
            FutureBuilder<QuerySnapshot<WatchListModel>>(
              future: FirebaseFunctions.getWatchList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(AppStrings.error),
                  );
                }
                var films =
                    snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                if (films.isEmpty) {
                  return Text('No films in watchlist');
                }
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return WatchListItem(watchListModel: films[index]);
                    },
                    itemCount: films.length,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
