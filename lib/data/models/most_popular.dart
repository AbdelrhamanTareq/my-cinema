// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'most_popular.g.dart';

@JsonSerializable()
class MostPopular {
  List<Items>? items;
  String? errorMessage;

  MostPopular({this.items, this.errorMessage});

  factory MostPopular.fromJson(Map<String, dynamic> json) =>
      _$MostPopularFromJson(json);

  Map<String, dynamic> toJson() => _$MostPopularToJson(this);
}

@JsonSerializable()
class Items {
  String? id;
  String? rank;
  String? rankUpDown;
  String? title;
  String? fullTitle;
  String? year;
  String? image;
  String? crew;
  String? imDbRating;
  String? imDbRatingCount;

  Items({
    this.id,
    this.rank,
    this.title,
    this.fullTitle,
    this.rankUpDown,
    this.image,
    this.imDbRating,
    this.imDbRatingCount,
    this.crew,
    this.year,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
