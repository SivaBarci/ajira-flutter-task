import 'package:ajira_flutter_app/core/constants/endpoints/endpoints.dart';
import 'package:dio/dio.dart';

Future<dynamic> getPosts({required int userId}) async {
  final dio = Dio();
  final response =
      await dio.get(postsEndpoint, queryParameters: {"userId": userId});
  if (response.statusCode != 200) {
    throw Exception(response.statusMessage);
  }
  return response.data;
}
