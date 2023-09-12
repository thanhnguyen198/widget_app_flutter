import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new.g.dart';

@JsonSerializable()
class New {
  String endAt;
  String content;
  String startAt;
  int id;
  String createdAt;
  String title;
  String categoryName;
  String displayNewPeriod;

  New({
    required this.endAt,
    required this.content,
    required this.startAt,
    required this.id,
    required this.createdAt,
    required this.title,
    required this.categoryName,
    required this.displayNewPeriod,
  });

  factory New.fromJson(Map<String, dynamic> json) => _$NewFromJson(json);
  Map<String, dynamic> toJson() => _$NewToJson(this);
}

extension NewX on New {
  bool isNew() {
    DateTime tempDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").parse(displayNewPeriod ?? "");
    return tempDate.compareTo(DateTime.now()) > 0;
  }
}
