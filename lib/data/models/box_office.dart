
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'box_office.g.dart';

@JsonSerializable()
class BoxOffice {
    List<Items>? items;
    String? errorMessage;

    BoxOffice({this.items, this.errorMessage});

 factory BoxOffice.fromJson(Map<String, dynamic> json) =>
      _$BoxOfficeFromJson(json);

  Map<String, dynamic> toJson() => _$BoxOfficeToJson(this);
    
}
@JsonSerializable()

class Items {
    String? id;
    String? rank;
    String? title;
    String? image;
    String? weekend;
    String? gross;
    String? weeks;

    Items({this.id, this.rank, this.title, this.image, this.weekend, this.gross, this.weeks});

  
 factory Items.fromJson(Map<String, dynamic> json) =>
      _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}