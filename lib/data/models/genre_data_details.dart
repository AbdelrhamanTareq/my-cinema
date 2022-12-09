// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'genre_data_details.g.dart';

@JsonSerializable()
class GenreDataDetails {
  GenreDataDetails({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.spokenLanguages,
    this.voteAverage,
    this.voteCount,
  });
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "belongs_to_collection")
  final dynamic belongsToCollection;
  final int? budget;
  final List<Genres>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "production_companies")
  final List<ProductionCompanies>? productionCompanies;
  @JsonKey(name: "production_countries")
  final List<ProductionCountries>? productionCountries;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  @JsonKey(name: "spoken_languages")
  final List<SpokenLanguages>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;

  factory GenreDataDetails.fromJson(Map<String, dynamic> json) =>
      _$GenreDataDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$GenreDataDetailsToJson(this);
}

@JsonSerializable()
class Genres {
  Genres({
    this.id,
    this.name,
  });
  final int? id;
  final String? name;

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

@JsonSerializable()
class ProductionCompanies {
  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);
}

@JsonSerializable()
class ProductionCountries {
  ProductionCountries({
    this.iso_3166_1,
    this.name,
  });
  final String? iso_3166_1;
  final String? name;

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
}

@JsonSerializable()
class SpokenLanguages {
  SpokenLanguages({
    this.englishName,
    this.iso_639_1,
    this.name,
  });
  final String? englishName;
  final String? iso_639_1;
  final String? name;

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);
}
