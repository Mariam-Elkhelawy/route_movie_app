class WatchListModel {
  String id;
  String title;
  String image;
  String description;
  String releaseDate;
  bool isWatchList;
  int movieId;

  WatchListModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.releaseDate,
    this.isWatchList = false,
    required this.movieId,
  });

  void toggleBookmark() {
    isWatchList = !isWatchList;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'description': description,
      'releaseDate': releaseDate,
      'isWatchList': isWatchList,
      'movieId': movieId,
    };
  }

  static WatchListModel fromJson(Map<String, dynamic> json) {
    return WatchListModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      releaseDate: json['releaseDate'],
      isWatchList: json['isWatchList'],
      movieId: json['movieId'],
    );
  }
}
