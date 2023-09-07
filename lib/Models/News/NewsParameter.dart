// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsParameter {
  int? page;

  NewsParameter(this.page);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
    };
  }

  factory NewsParameter.fromMap(Map<String, dynamic> map) {
    return NewsParameter(
      map['page'] != null ? map['page'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsParameter.fromJson(String source) =>
      NewsParameter.fromMap(json.decode(source) as Map<String, dynamic>);
}
