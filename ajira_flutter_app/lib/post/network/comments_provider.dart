import 'package:ajira_flutter_app/core/constants/endpoints/endpoints.dart';
import 'package:dio/dio.dart';

Future<dynamic> getComments({required int postId}) async {
  final dio = Dio();
  final response =
      await dio.get(commentsEndpoint, queryParameters: {"postId": postId});
  if (response.statusCode != 200) {
    throw Exception(response.statusMessage);
  }
  return response.data;
}
