import 'package:ajira_flutter_app/core/constants/endpoints/endpoints.dart';
import 'package:dio/dio.dart';

Future<dynamic> getAlbums({required int userId}) async {
  final dio = Dio();
  final response =
      await dio.get(albumsEndpoint, queryParameters: {"userId": userId});
  if (response.statusCode != 0) {
    if (response.statusMessage?.toUpperCase() != "OK") {
      throw Exception(response.statusMessage);
    }
  }
  return response.data;
}
