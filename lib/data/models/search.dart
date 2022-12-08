// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable()
class Search {
  Search({
    required this.searchType,
    required this.expression,
    required this.results,
    required this.errorMessage,
  });
  late final String searchType;
  late final String expression;
  late final List<Results> results;
  late final String errorMessage;

  factory Search.fromJson(Map<String, dynamic> json) =>
      _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}

@JsonSerializable()
class Results {
  Results({
    required this.id,
    required this.resultType,
    required this.image,
    required this.title,
    required this.description,
  });
  late final String id;
  late final String resultType;
  late final String image;
  late final String title;
  late final String description;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
