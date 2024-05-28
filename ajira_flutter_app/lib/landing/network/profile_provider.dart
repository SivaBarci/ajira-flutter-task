import 'package:ajira_flutter_app/core/constants/endpoints/endpoints.dart';
import 'package:dio/dio.dart';

Future<dynamic> getProfile({required int id}) async {
  final dio = Dio();
  final response = await dio.get(profileEndpoint, queryParameters: {"id": id});
  if (response.statusCode != 200) {
    throw Exception(response.statusMessage);
  }
  return response.data;
}
