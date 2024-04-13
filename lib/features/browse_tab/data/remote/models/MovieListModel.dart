class MovieListModel {
  List<Genres>? genres;

  MovieListModel({this.genres});

  MovieListModel.fromJson(dynamic json) {
    if (json["genres"] != null) {
      genres = [];
      json["genres"].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }
}

/// id : 28
/// name : "Action"

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }
}
