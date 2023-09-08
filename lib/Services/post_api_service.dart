import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'post_api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
  @GET("/posts")
  Future<List<Post>> getTasks();
}

@JsonSerializable()
class Post {
  int userId;
  int id;
  String body;
  String title;
  Post(
      {required this.userId,
      required this.id,
      required this.body,
      required this.title});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
