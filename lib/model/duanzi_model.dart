import 'package:json_annotation/json_annotation.dart';

part 'package:douban_me/model/duanzi_model.g.dart';

@JsonSerializable()
class DuanziModel extends Object with _$DuanziModelSerializerMixin {
  String text;
  String type;
  @JsonKey(name: 'video_uri')
  String videoUri;
  @JsonKey(name: 'name')
  String userName;
  @JsonKey(name: 'profile_image')
  String userIcon;
  String love;
  String hate;
  String image0;

  DuanziModel(this.text, this.type, this.videoUri, this.userName, this.userIcon,
      this.love, this.hate, this.image0);

  factory DuanziModel.fromJson(Map<String, dynamic> json) =>
      _$DuanziModelFromJson(json);
}