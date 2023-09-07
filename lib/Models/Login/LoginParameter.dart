// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginParameter {
  String? deviceId;
  String? accessToken;
  String? appVersion;
  String? deviceOs;
  String? deviceOsVersion;
  String? deviceName;

  LoginParameter(
    this.deviceId,
    this.accessToken,
    this.appVersion,
    this.deviceOs,
    this.deviceOsVersion,
    this.deviceName,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'device_id': deviceId,
      'access_token': accessToken,
      'app_version': appVersion,
      'device_os': deviceOs,
      'device_os_version': deviceOsVersion,
      'device_name': deviceName,
    };
  }

  factory LoginParameter.fromMap(Map<String, dynamic> map) {
    return LoginParameter(
      map['device_id'] != null ? map['deviceId'] as String : null,
      map['access_token'] != null ? map['accessToken'] as String : null,
      map['app_version'] != null ? map['appVersion'] as String : null,
      map['device_os'] != null ? map['deviceOs'] as String : null,
      map['device_os_version'] != null
          ? map['deviceOsVersion'] as String
          : null,
      map['device_name'] != null ? map['deviceName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginParameter.fromJson(String source) =>
      LoginParameter.fromMap(json.decode(source) as Map<String, dynamic>);
}
