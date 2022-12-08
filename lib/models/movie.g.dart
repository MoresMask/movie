// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      image: json['image'] as String?,
      rating: json['rating'] as String?,
      thumbnail: json['thumbnail'] as String?,
      title: json['title'] as String?,
      year: json['year'] as int?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'rating': instance.rating,
      'year': instance.year,
      'thumbnail': instance.thumbnail,
    };
