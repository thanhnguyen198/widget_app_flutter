// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'login_info.g.dart';

@JsonSerializable()
class LoginInfo {
  String deviceId;
  String accessToken;
  String appVersion;
  String deviceOs;
  String deviceOsVersion;
  String deviceName;

  LoginInfo({
    required this.deviceId,
    required this.accessToken,
    required this.appVersion,
    required this.deviceOs,
    required this.deviceOsVersion,
    required this.deviceName,
  });
  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);
}
