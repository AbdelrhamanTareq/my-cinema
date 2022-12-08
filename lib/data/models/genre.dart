
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'genre.g.dart';


@JsonSerializable()
class Genre {
  List<Genres>? genres;
  Genre({this.genres});
  factory Genre.fromJson(Map<String, dynamic> json) =>
      _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
@JsonSerializable()

class Genres {
  int? id;
  String? name;
Genres({this.id,this.name});
  factory Genres.fromJson(Map<String, dynamic> json) =>
      _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}