import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  String? image;
  String? title;
  String? rating;
  int? year;
  String? thumbnail;

  Movie({this.image, this.rating, this.thumbnail, this.title, this.year});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
