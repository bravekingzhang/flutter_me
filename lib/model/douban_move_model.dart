import 'package:json_annotation/json_annotation.dart';

part 'package:douban_me/model/douban_move_model.g.dart';

@JsonSerializable()
class DoubanModel extends Object with _$DoubanModelSerializerMixin {
  DoubanModel(this.rating, this.genres, this.title, this.casts, this.durations,
      this.directors, this.images);

  Rating rating;
  List<String> genres;
  String title;
  List<Avatar> casts;
  List<String> durations;
  List<Director> directors;
  Map<String, String> images;

  factory DoubanModel.fromJson(Map<String, dynamic> json) =>
      _$DoubanModelFromJson(json);
}

@JsonSerializable()
class Rating extends Object with _$RatingSerializerMixin {
  Rating(this.average, this.max);

  double average;
  int max;


  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}

@JsonSerializable()
class Avatar extends Object with _$AvatarSerializerMixin {
  @JsonKey(name: 'avatars')
  Map<String,String> icons;
  String name_en;
  String name;
  String alt;

  Avatar(this.icons, this.name_en, this.name, this.alt);

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}

@JsonSerializable()
class Director extends Object with _$DirectorSerializerMixin {
  @JsonKey(name: 'avatars')
  Map<String,String> icons;
  String name_en;
  String name;
  String alt;

  Director(this.icons, this.name_en, this.name, this.alt);

  factory Director.fromJson(Map<String, dynamic> json) =>
      _$DirectorFromJson(json);
}
