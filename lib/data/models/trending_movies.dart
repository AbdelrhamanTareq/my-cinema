// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'trending_movies.g.dart';

@JsonSerializable()
class Trending   {
  int? page;
  List<Results>? results;
  @JsonKey(name:"total_pages")
  int? totalPages;
  @JsonKey(name:"total_results")
  int? totalResults;

  Trending({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory Trending.fromJson(Map<String, dynamic> json) =>
      _$TrendingFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingToJson(this);
  

  
}







@JsonSerializable()
class Results {
  bool? adult;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "genre_ids")
  List<int>? genreIds;
  int? id;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "original_title")
  String? originalTitle;
  String? overview;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "release_date")
  String? releaseDate;
  String? title;
  bool? video;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;
  double? popularity;
  @JsonKey(name: "first_air_date")
  String? firstAirDate;
  String? name;
  @JsonKey(name: "origin_country")
  List<String>? originCountry;
  @JsonKey(name: "origin_name")
  String? originalName;

  Results(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.popularity,
      this.firstAirDate,
      this.name,
      this.originCountry,
      this.originalName});

   factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

