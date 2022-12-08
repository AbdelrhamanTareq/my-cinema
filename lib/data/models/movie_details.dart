// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable()
class MovieDetails {
  MovieDetails({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.image,
    required this.releaseDate,
    required this.runtimeMins,
    required this.runtimeStr,
    required this.plot,
    required this.plotLocal,
    required this.plotLocalIsRtl,
    required this.awards,
    required this.directors,
    required this.directorList,
    required this.writers,
    required this.writerList,
    required this.stars,
    required this.starList,
    required this.actorList,
    this.fullCast,
    required this.genres,
    required this.genreList,
    required this.companies,
    required this.companyList,
    required this.countries,
    required this.countryList,
    required this.languages,
    required this.languageList,
    required this.contentRating,
    required this.imDbRating,
    required this.imDbRatingVotes,
    required this.metacriticRating,
    this.ratings,
    this.wikipedia,
    this.posters,
    this.images,
    this.trailer,
    required this.boxOffice,
    this.tagline,
    required this.keywords,
    required this.keywordList,
    required this.similars,
    this.tvSeriesInfo,
    this.tvEpisodeInfo,
    this.errorMessage,
  });
  final String? id;
  final String? title;
  final String? originalTitle;
  final String? fullTitle;
  final String? type;
  final String? year;
  final String? image;
  final String? releaseDate;
  final String? runtimeMins;
  final String? runtimeStr;
  final String? plot;
  final String? plotLocal;
  final bool? plotLocalIsRtl;
  final String? awards;
  final String? directors;
  final List<DirectorList>? directorList;
  final String? writers;
  final List<WriterList>? writerList;
  final String? stars;
  final List<StarList>? starList;
  final List<ActorList>? actorList;
  final dynamic fullCast;
  final String? genres;
  final List<GenreList>? genreList;
  final String? companies;
  final List<CompanyList>? companyList;
  final String? countries;
  final List<CountryList>? countryList;
  final String? languages;
  final List<LanguageList>? languageList;
  final String? contentRating;
  final String? imDbRating;
  final String? imDbRatingVotes;
  final String? metacriticRating;
  final dynamic ratings;
  final dynamic wikipedia;
  final dynamic posters;
  final dynamic images;
  final Trailer? trailer;
  final BoxOfficeDetails? boxOffice;
  final dynamic tagline;
  final String? keywords;
  final List<String>? keywordList;
  final List<Similars>? similars;
  final dynamic tvSeriesInfo;
  final dynamic tvEpisodeInfo;
  final dynamic errorMessage;

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}

@JsonSerializable()
class DirectorList {
  DirectorList({
    required this.id,
    required this.name,
  });
  final String? id;
  final String? name;

  factory DirectorList.fromJson(Map<String, dynamic> json) =>
      _$DirectorListFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorListToJson(this);
}

@JsonSerializable()
class WriterList {
  WriterList({
    required this.id,
    required this.name,
  });
  final String? id;
  final String? name;

  factory WriterList.fromJson(Map<String, dynamic> json) =>
      _$WriterListFromJson(json);

  Map<String, dynamic> toJson() => _$WriterListToJson(this);
}

@JsonSerializable()
class StarList {
  StarList({
    required this.id,
    required this.name,
  });
  final String? id;
  final String? name;
  factory StarList.fromJson(Map<String, dynamic> json) =>
      _$StarListFromJson(json);

  Map<String, dynamic> toJson() => _$StarListToJson(this);
}

@JsonSerializable()
class ActorList {
  ActorList({
    required this.id,
    required this.image,
    required this.name,
    required this.asCharacter,
  });
  final String? id;
  final String? image;
  final String? name;
  final String? asCharacter;

  factory ActorList.fromJson(Map<String, dynamic> json) =>
      _$ActorListFromJson(json);

  Map<String, dynamic> toJson() => _$ActorListToJson(this);
}

@JsonSerializable()
class GenreList {
  GenreList({
    required this.key,
    required this.value,
  });
  final String? key;
  final String? value;
  factory GenreList.fromJson(Map<String, dynamic> json) =>
      _$GenreListFromJson(json);

  Map<String, dynamic> toJson() => _$GenreListToJson(this);
}

@JsonSerializable()
class CompanyList {
  CompanyList({
    required this.id,
    required this.name,
  });
  final String? id;
  final String? name;

  factory CompanyList.fromJson(Map<String, dynamic> json) =>
      _$CompanyListFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyListToJson(this);
}

@JsonSerializable()
class CountryList {
  CountryList({
    required this.key,
    required this.value,
  });
  final String? key;
  final String? value;

  factory CountryList.fromJson(Map<String, dynamic> json) =>
      _$CountryListFromJson(json);

  Map<String, dynamic> toJson() => _$CountryListToJson(this);
}

@JsonSerializable()
class LanguageList {
  LanguageList({
    required this.key,
    required this.value,
  });
  final String? key;
  final String? value;

  factory LanguageList.fromJson(Map<String, dynamic> json) =>
      _$LanguageListFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageListToJson(this);
}

@JsonSerializable()
class BoxOfficeDetails {
  BoxOfficeDetails({
    required this.budget,
    required this.openingWeekendUSA,
    required this.grossUSA,
    required this.cumulativeWorldwideGross,
  });
  final String? budget;
  final String? openingWeekendUSA;
  final String? grossUSA;
  final String? cumulativeWorldwideGross;

  factory BoxOfficeDetails.fromJson(Map<String, dynamic> json) =>
      _$BoxOfficeDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BoxOfficeDetailsToJson(this);
}

@JsonSerializable()
class Similars {
  Similars({
    required this.id,
    required this.title,
    required this.image,
    required this.imDbRating,
  });
  final String? id;
  final String? title;
  final String? image;
  final String? imDbRating;

  factory Similars.fromJson(Map<String, dynamic> json) =>
      _$SimilarsFromJson(json);

  Map<String, dynamic> toJson() => _$SimilarsToJson(this);
}

@JsonSerializable()
class Trailer {
  Trailer({
    required this.imDbId,
    required this.title,
    required this.videoDescription,
    required this.year,
    required this.link,
    required this.thumbnailUrl,
    required this.linkEmbed,

  });
  final String? imDbId;
  final String? title;
  final String? videoDescription;
  final String? year;
  final String? link;
  final String? linkEmbed;
  final String? thumbnailUrl;

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}