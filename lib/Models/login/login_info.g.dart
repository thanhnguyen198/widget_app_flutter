// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) => LoginInfo(
      deviceId: json['deviceId'] as String,
      accessToken: json['accessToken'] as String,
      appVersion: json['appVersion'] as String,
      deviceOs: json['deviceOs'] as String,
      deviceOsVersion: json['deviceOsVersion'] as String,
      deviceName: json['deviceName'] as String,
    );

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
      'deviceId': instance.deviceId,
      'accessToken': instance.accessToken,
      'appVersion': instance.appVersion,
      'deviceOs': instance.deviceOs,
      'deviceOsVersion': instance.deviceOsVersion,
      'deviceName': instance.deviceName,
    };
