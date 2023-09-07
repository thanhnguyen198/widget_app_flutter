import 'package:widget_app/Models/BaseResponse.dart';
import 'package:intl/intl.dart';

class ResponseNews extends BaseResponse {
  String? endAt;
  String? content;
  String? startAt;
  int? id;
  String? createdAt;
  String? title;
  String? categoryName;
  String? displayNewPeriod;

  ResponseNews(
      {this.endAt,
      this.content,
      this.startAt,
      this.id,
      this.createdAt,
      this.title,
      this.categoryName,
      this.displayNewPeriod});

  ResponseNews.fromJson(Map<String, dynamic> json) {
    endAt = json['end_at'];
    content = json['content'];
    startAt = json['start_at'];
    id = json['id'];
    DateTime tempDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").parse(json['created_at']);
    createdAt = DateFormat("yyyy-MM-dd").format(tempDate);
    title = json['title'];
    categoryName = json['category_name'];
    displayNewPeriod = json['display_new_period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['end_at'] = endAt;
    data['content'] = content;
    data['start_at'] = startAt;
    data['id'] = id;
    data['created_at'] = createdAt;
    data['title'] = title;
    data['category_name'] = categoryName;
    data['display_new_period'] = displayNewPeriod;
    return data;
  }
}

extension ResponseNewsX on ResponseNews {
  bool isNew() {
    DateTime tempDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").parse(displayNewPeriod ?? "");
    return tempDate.compareTo(DateTime.now()) > 0;
  }
}
