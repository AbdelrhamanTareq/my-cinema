// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) => Search(
      searchType: json['searchType'] as String,
      expression: json['expression'] as String,
      results: (json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['errorMessage'] as String,
    );

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'searchType': instance.searchType,
      'expression': instance.expression,
      'results': instance.results,
      'errorMessage': instance.errorMessage,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      id: json['id'] as String,
      resultType: json['resultType'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'resultType': instance.resultType,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
    };
