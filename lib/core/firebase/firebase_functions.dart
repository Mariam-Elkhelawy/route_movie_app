import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:route_movie_app/features/watchList_tab/data/models/watch_list_model.dart';

class FirebaseFunctions {
  static CollectionReference<WatchListModel> getWatchListCollection() {
    return FirebaseFirestore.instance
        .collection('WatchList')
        .withConverter<WatchListModel>(
      fromFirestore: (snapshot, _) {
        return WatchListModel.fromJson(snapshot.data()!);
      },
      toFirestore: (watchList, _) {
        return watchList.toJson();
      },
    );
  }

  static Future<bool> checkIfFilmExists(String filmId) async {
    try {
      final snapshot = await getWatchListCollection().get();
      return snapshot.docs.any((doc) => doc.id == filmId);
    } catch (e) {
      return false;
    }
  }

  static Future<bool> addWatchlist({
    required WatchListModel watchListModel,
    required Function onException,
  }) async {
    try {
      final filmExists = await checkIfFilmExists(watchListModel.id);
      if (filmExists) {
        onException(
            'Film already exists in watchlist : ${watchListModel.title}');
        return filmExists;
      }

      await getWatchListCollection().doc(watchListModel.id).set(watchListModel);
      onException('Film added to watchlist : ${watchListModel.title}');
      return filmExists;
    } catch (e) {
      onException('Error adding film to watchlist: $e');
      return false;
    }
  }

  static Stream<QuerySnapshot<WatchListModel>> getWatchList() {
    return getWatchListCollection().snapshots();
  }

  static Future<void> deleteWatchList({
    required String id,
  }) {
    return getWatchListCollection().doc(id).delete();
  }
}
