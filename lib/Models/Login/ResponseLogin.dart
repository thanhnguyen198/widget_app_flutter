// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../models/baseResponse.dart';

class ResponseLogin extends BaseResponse {
  String? email;
  String? tokenExpirationDate;
  String? accessToken;

  ResponseLogin({this.email, this.tokenExpirationDate, this.accessToken});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    tokenExpirationDate = json['token_expiration_date'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['token_expiration_date'] = tokenExpirationDate;
    data['access_token'] = accessToken;
    return data;
  }
}
