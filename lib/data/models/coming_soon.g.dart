// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coming_soon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComingSoon _$ComingSoonFromJson(Map<String, dynamic> json) => ComingSoon(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ComingSoonToJson(ComingSoon instance) =>
    <String, dynamic>{
      'items': instance.items,
      'errorMessage': instance.errorMessage,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      id: json['id'] as String?,
      title: json['title'] as String?,
      fullTitle: json['fullTitle'] as String?,
      year: json['year'] as String?,
      releaseState: json['releaseState'] as String?,
      image: json['image'] as String?,
      runtimeMins: json['runtimeMins'],
      runtimeStr: json['runtimeStr'],
      plot: json['plot'],
      contentRating: json['contentRating'],
      imDbRating: json['imDbRating'],
      imDbRatingCount: json['imDbRatingCount'],
      metacriticRating: json['metacriticRating'],
      genres: json['genres'] as String?,
      genreList: (json['genreList'] as List<dynamic>?)
          ?.map((e) => GenreList.fromJson(e as Map<String, dynamic>))
          .toList(),
      directors: json['directors'],
      directorList: json['directorList'] as List<dynamic>?,
      stars: json['stars'] as String?,
      starList: (json['starList'] as List<dynamic>?)
          ?.map((e) => StarList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'year': instance.year,
      'releaseState': instance.releaseState,
      'image': instance.image,
      'runtimeMins': instance.runtimeMins,
      'runtimeStr': instance.runtimeStr,
      'plot': instance.plot,
      'contentRating': instance.contentRating,
      'imDbRating': instance.imDbRating,
      'imDbRatingCount': instance.imDbRatingCount,
      'metacriticRating': instance.metacriticRating,
      'genres': instance.genres,
      'genreList': instance.genreList,
      'directors': instance.directors,
      'directorList': instance.directorList,
      'stars': instance.stars,
      'starList': instance.starList,
    };

GenreList _$GenreListFromJson(Map<String, dynamic> json) => GenreList(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$GenreListToJson(GenreList instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

StarList _$StarListFromJson(Map<String, dynamic> json) => StarList(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$StarListToJson(StarList instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
