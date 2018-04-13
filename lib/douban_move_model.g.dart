// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'douban_move_model.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

DoubanModel _$DoubanModelFromJson(Map<String, dynamic> json) => new DoubanModel(
    json['rating'] == null
        ? null
        : new Rating.fromJson(json['rating'] as Map<String, dynamic>),
    (json['genres'] as List)?.map((e) => e as String)?.toList(),
    json['title'] as String,
    (json['casts'] as List)
        ?.map((e) =>
            e == null ? null : new Avatar.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['durations'] as List)?.map((e) => e as String)?.toList(),
    (json['directors'] as List)
        ?.map((e) =>
            e == null ? null : new Director.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['images'] == null
        ? null
        : new Map<String, String>.from(json['images'] as Map));

abstract class _$DoubanModelSerializerMixin {
  Rating get rating;
  List<String> get genres;
  String get title;
  List<Avatar> get casts;
  List<String> get durations;
  List<Director> get directors;
  Map<String, String> get images;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'rating': rating,
        'genres': genres,
        'title': title,
        'casts': casts,
        'durations': durations,
        'directors': directors,
        'images': images
      };
}

Rating _$RatingFromJson(Map<String, dynamic> json) =>
    new Rating((json['average'] as num)?.toDouble(), json['max'] as int);

abstract class _$RatingSerializerMixin {
  double get average;
  int get max;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'average': average, 'max': max};
}

Avatar _$AvatarFromJson(Map<String, dynamic> json) => new Avatar(
    json['avatars'] == null
        ? null
        : new Map<String, String>.from(json['avatars'] as Map),
    json['name_en'] as String,
    json['name'] as String,
    json['alt'] as String);

abstract class _$AvatarSerializerMixin {
  Map<String, String> get icons;
  String get name_en;
  String get name;
  String get alt;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'avatars': icons,
        'name_en': name_en,
        'name': name,
        'alt': alt
      };
}

Director _$DirectorFromJson(Map<String, dynamic> json) => new Director(
    json['avatars'] == null
        ? null
        : new Map<String, String>.from(json['avatars'] as Map),
    json['name_en'] as String,
    json['name'] as String,
    json['alt'] as String);

abstract class _$DirectorSerializerMixin {
  Map<String, String> get icons;
  String get name_en;
  String get name;
  String get alt;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'avatars': icons,
        'name_en': name_en,
        'name': name,
        'alt': alt
      };
}
