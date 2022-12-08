// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_popular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MostPopular _$MostPopularFromJson(Map<String, dynamic> json) => MostPopular(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$MostPopularToJson(MostPopular instance) =>
    <String, dynamic>{
      'items': instance.items,
      'errorMessage': instance.errorMessage,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      id: json['id'] as String?,
      rank: json['rank'] as String?,
      title: json['title'] as String?,
      fullTitle: json['fullTitle'] as String?,
      rankUpDown: json['rankUpDown'] as String?,
      image: json['image'] as String?,
      imDbRating: json['imDbRating'] as String?,
      imDbRatingCount: json['imDbRatingCount'] as String?,
      crew: json['crew'] as String?,
      year: json['year'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'rankUpDown': instance.rankUpDown,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'year': instance.year,
      'image': instance.image,
      'crew': instance.crew,
      'imDbRating': instance.imDbRating,
      'imDbRatingCount': instance.imDbRatingCount,
    };
