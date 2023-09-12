// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      email: json['email'] as String,
      tokenExpirationDate: json['tokenExpirationDate'] as String,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'email': instance.email,
      'tokenExpirationDate': instance.tokenExpirationDate,
      'accessToken': instance.accessToken,
    };
