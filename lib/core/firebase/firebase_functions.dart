import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:route_movie_app/features/watchList_tab/data/models/watch_list_model.dart';

class FirebaseFunctions {

 static CollectionReference<WatchListModel> getWatchListCollection() {
   return   FirebaseFirestore.instance
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
  static Future<void> addWatchList(WatchListModel watchListModel) {
   List<int> ids = [];
   /*if(!ids.contains(watchListModel.movieId)){*/
     var collection =  getWatchListCollection();
     var docRef =collection.doc();
     watchListModel.id = docRef.id ;
     return docRef.set(watchListModel);
   /*else if(ids.contains(watchListModel.movieId)){
     ids.remove(watchListModel.movieId);
     watchListModel.removeWhere((element) => element.id == resultsMovie.id);
   }*/


 }
static Future<QuerySnapshot<WatchListModel>>getWatchList() {
   return getWatchListCollection().get();
 }


}
