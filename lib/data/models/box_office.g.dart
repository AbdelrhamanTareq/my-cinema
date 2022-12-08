// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoxOffice _$BoxOfficeFromJson(Map<String, dynamic> json) => BoxOffice(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$BoxOfficeToJson(BoxOffice instance) => <String, dynamic>{
      'items': instance.items,
      'errorMessage': instance.errorMessage,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      id: json['id'] as String?,
      rank: json['rank'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      weekend: json['weekend'] as String?,
      gross: json['gross'] as String?,
      weeks: json['weeks'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'title': instance.title,
      'image': instance.image,
      'weekend': instance.weekend,
      'gross': instance.gross,
      'weeks': instance.weeks,
    };
