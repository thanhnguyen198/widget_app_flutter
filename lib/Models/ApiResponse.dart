import '../models/baseResponse.dart';

class ApiResponse<T extends BaseResponse> {
  late List<T> _datas;
  bool? status;
  T? data;
  List<T> get datas => _datas;

  ApiResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    status = json['status'];
    if (json["data"] is List) {
      _datas = (json['data'] as List<dynamic>)
          .map((e) => create(e as Map<String, dynamic>) as T)
          .toList();
    } else {
      data = create(json["data"]);
    }
  }
}
