
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'coming_soon.g.dart';
@JsonSerializable()
class ComingSoon {
  List<Items>? items;
  String? errorMessage;

  ComingSoon({this.items, this.errorMessage});

 factory ComingSoon.fromJson(Map<String, dynamic> json) =>
      _$ComingSoonFromJson(json);

  Map<String, dynamic> toJson() => _$ComingSoonToJson(this);


}
@JsonSerializable()
class Items {
  String? id;
  String? title;
  String? fullTitle;
  String? year;
  String? releaseState;
  String? image;
  dynamic runtimeMins;
  dynamic runtimeStr;
  dynamic plot;
  dynamic contentRating;
  dynamic imDbRating;
  dynamic imDbRatingCount;
  dynamic metacriticRating;
  String? genres;
  List<GenreList>? genreList;
  dynamic directors;
  List<dynamic>? directorList;
  String? stars;
  List<StarList>? starList;

  Items(
      {this.id,
      this.title,
      this.fullTitle,
      this.year,
      this.releaseState,
      this.image,
      this.runtimeMins,
      this.runtimeStr,
      this.plot,
      this.contentRating,
      this.imDbRating,
      this.imDbRatingCount,
      this.metacriticRating,
      this.genres,
      this.genreList,
      this.directors,
      this.directorList,
      this.stars,
      this.starList});

 factory Items.fromJson(Map<String, dynamic> json) =>
      _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);

  
}
@JsonSerializable()
class GenreList {
  String? key;
  String? value;

  GenreList({this.key, this.value});
factory GenreList.fromJson(Map<String, dynamic> json) =>
      _$GenreListFromJson(json);

  Map<String, dynamic> toJson() => _$GenreListToJson(this);
 
}
@JsonSerializable()
class StarList {
  int? id;
  String? name;

  StarList({this.id, this.name});

   factory StarList.fromJson(Map<String, dynamic> json) =>
      _$StarListFromJson(json);

  Map<String, dynamic> toJson() => _$StarListToJson(this);


}