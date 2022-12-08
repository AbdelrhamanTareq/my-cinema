// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
      id: json['id'] as String?,
      title: json['title'] as String?,
      originalTitle: json['originalTitle'] as String?,
      fullTitle: json['fullTitle'] as String?,
      type: json['type'] as String?,
      year: json['year'] as String?,
      image: json['image'] as String?,
      releaseDate: json['releaseDate'] as String?,
      runtimeMins: json['runtimeMins'] as String?,
      runtimeStr: json['runtimeStr'] as String?,
      plot: json['plot'] as String?,
      plotLocal: json['plotLocal'] as String?,
      plotLocalIsRtl: json['plotLocalIsRtl'] as bool?,
      awards: json['awards'] as String?,
      directors: json['directors'] as String?,
      directorList: (json['directorList'] as List<dynamic>?)
          ?.map((e) => DirectorList.fromJson(e as Map<String, dynamic>))
          .toList(),
      writers: json['writers'] as String?,
      writerList: (json['writerList'] as List<dynamic>?)
          ?.map((e) => WriterList.fromJson(e as Map<String, dynamic>))
          .toList(),
      stars: json['stars'] as String?,
      starList: (json['starList'] as List<dynamic>?)
          ?.map((e) => StarList.fromJson(e as Map<String, dynamic>))
          .toList(),
      actorList: (json['actorList'] as List<dynamic>?)
          ?.map((e) => ActorList.fromJson(e as Map<String, dynamic>))
          .toList(),
      fullCast: json['fullCast'],
      genres: json['genres'] as String?,
      genreList: (json['genreList'] as List<dynamic>?)
          ?.map((e) => GenreList.fromJson(e as Map<String, dynamic>))
          .toList(),
      companies: json['companies'] as String?,
      companyList: (json['companyList'] as List<dynamic>?)
          ?.map((e) => CompanyList.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: json['countries'] as String?,
      countryList: (json['countryList'] as List<dynamic>?)
          ?.map((e) => CountryList.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: json['languages'] as String?,
      languageList: (json['languageList'] as List<dynamic>?)
          ?.map((e) => LanguageList.fromJson(e as Map<String, dynamic>))
          .toList(),
      contentRating: json['contentRating'] as String?,
      imDbRating: json['imDbRating'] as String?,
      imDbRatingVotes: json['imDbRatingVotes'] as String?,
      metacriticRating: json['metacriticRating'] as String?,
      ratings: json['ratings'],
      wikipedia: json['wikipedia'],
      posters: json['posters'],
      images: json['images'],
      trailer: json['trailer'] == null
          ? null
          : Trailer.fromJson(json['trailer'] as Map<String, dynamic>),
      boxOffice: json['boxOffice'] == null
          ? null
          : BoxOfficeDetails.fromJson(
              json['boxOffice'] as Map<String, dynamic>),
      tagline: json['tagline'],
      keywords: json['keywords'] as String?,
      keywordList: (json['keywordList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      similars: (json['similars'] as List<dynamic>?)
          ?.map((e) => Similars.fromJson(e as Map<String, dynamic>))
          .toList(),
      tvSeriesInfo: json['tvSeriesInfo'],
      tvEpisodeInfo: json['tvEpisodeInfo'],
      errorMessage: json['errorMessage'],
    );

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'originalTitle': instance.originalTitle,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'image': instance.image,
      'releaseDate': instance.releaseDate,
      'runtimeMins': instance.runtimeMins,
      'runtimeStr': instance.runtimeStr,
      'plot': instance.plot,
      'plotLocal': instance.plotLocal,
      'plotLocalIsRtl': instance.plotLocalIsRtl,
      'awards': instance.awards,
      'directors': instance.directors,
      'directorList': instance.directorList,
      'writers': instance.writers,
      'writerList': instance.writerList,
      'stars': instance.stars,
      'starList': instance.starList,
      'actorList': instance.actorList,
      'fullCast': instance.fullCast,
      'genres': instance.genres,
      'genreList': instance.genreList,
      'companies': instance.companies,
      'companyList': instance.companyList,
      'countries': instance.countries,
      'countryList': instance.countryList,
      'languages': instance.languages,
      'languageList': instance.languageList,
      'contentRating': instance.contentRating,
      'imDbRating': instance.imDbRating,
      'imDbRatingVotes': instance.imDbRatingVotes,
      'metacriticRating': instance.metacriticRating,
      'ratings': instance.ratings,
      'wikipedia': instance.wikipedia,
      'posters': instance.posters,
      'images': instance.images,
      'trailer': instance.trailer,
      'boxOffice': instance.boxOffice,
      'tagline': instance.tagline,
      'keywords': instance.keywords,
      'keywordList': instance.keywordList,
      'similars': instance.similars,
      'tvSeriesInfo': instance.tvSeriesInfo,
      'tvEpisodeInfo': instance.tvEpisodeInfo,
      'errorMessage': instance.errorMessage,
    };

DirectorList _$DirectorListFromJson(Map<String, dynamic> json) => DirectorList(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DirectorListToJson(DirectorList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

WriterList _$WriterListFromJson(Map<String, dynamic> json) => WriterList(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WriterListToJson(WriterList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

StarList _$StarListFromJson(Map<String, dynamic> json) => StarList(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$StarListToJson(StarList instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ActorList _$ActorListFromJson(Map<String, dynamic> json) => ActorList(
      id: json['id'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      asCharacter: json['asCharacter'] as String?,
    );

Map<String, dynamic> _$ActorListToJson(ActorList instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'asCharacter': instance.asCharacter,
    };

GenreList _$GenreListFromJson(Map<String, dynamic> json) => GenreList(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$GenreListToJson(GenreList instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

CompanyList _$CompanyListFromJson(Map<String, dynamic> json) => CompanyList(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CompanyListToJson(CompanyList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CountryList _$CountryListFromJson(Map<String, dynamic> json) => CountryList(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$CountryListToJson(CountryList instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

LanguageList _$LanguageListFromJson(Map<String, dynamic> json) => LanguageList(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$LanguageListToJson(LanguageList instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

BoxOfficeDetails _$BoxOfficeDetailsFromJson(Map<String, dynamic> json) =>
    BoxOfficeDetails(
      budget: json['budget'] as String?,
      openingWeekendUSA: json['openingWeekendUSA'] as String?,
      grossUSA: json['grossUSA'] as String?,
      cumulativeWorldwideGross: json['cumulativeWorldwideGross'] as String?,
    );

Map<String, dynamic> _$BoxOfficeDetailsToJson(BoxOfficeDetails instance) =>
    <String, dynamic>{
      'budget': instance.budget,
      'openingWeekendUSA': instance.openingWeekendUSA,
      'grossUSA': instance.grossUSA,
      'cumulativeWorldwideGross': instance.cumulativeWorldwideGross,
    };

Similars _$SimilarsFromJson(Map<String, dynamic> json) => Similars(
      id: json['id'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      imDbRating: json['imDbRating'] as String?,
    );

Map<String, dynamic> _$SimilarsToJson(Similars instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'imDbRating': instance.imDbRating,
    };

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
      imDbId: json['imDbId'] as String?,
      title: json['title'] as String?,
      videoDescription: json['videoDescription'] as String?,
      year: json['year'] as String?,
      link: json['link'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      linkEmbed: json['linkEmbed'] as String?,
    );

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'imDbId': instance.imDbId,
      'title': instance.title,
      'videoDescription': instance.videoDescription,
      'year': instance.year,
      'link': instance.link,
      'linkEmbed': instance.linkEmbed,
      'thumbnailUrl': instance.thumbnailUrl,
    };
