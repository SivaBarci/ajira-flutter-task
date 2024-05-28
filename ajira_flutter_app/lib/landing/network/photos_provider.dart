import 'package:ajira_flutter_app/core/constants/endpoints/endpoints.dart';
import 'package:dio/dio.dart';

Future<dynamic> getPhotos({required int albumId}) async {
  final dio = Dio();
  final response =
      await dio.get(photosEndpoint, queryParameters: {"albumId": albumId});
  if (response.statusCode != 200) {
    throw Exception(response.statusMessage);
  }
  return response.data;
}
