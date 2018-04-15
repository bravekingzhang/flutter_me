// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duanzi_model.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

DuanziModel _$DuanziModelFromJson(Map<String, dynamic> json) => new DuanziModel(
    json['text'] as String,
    json['type'] as String,
    json['video_uri'] as String,
    json['name'] as String,
    json['profile_image'] as String,
    json['love'] as String,
    json['hate'] as String,
    json['image0'] as String);

abstract class _$DuanziModelSerializerMixin {
  String get text;
  String get type;
  String get videoUri;
  String get userName;
  String get userIcon;
  String get love;
  String get hate;
  String get image0;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text,
        'type': type,
        'video_uri': videoUri,
        'name': userName,
        'profile_image': userIcon,
        'love': love,
        'hate': hate,
        'image0': image0
      };
}
