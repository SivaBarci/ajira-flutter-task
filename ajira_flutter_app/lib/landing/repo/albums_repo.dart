import 'package:ajira_flutter_app/landing/model/album_model.dart';
import 'package:ajira_flutter_app/landing/network/albums_provider.dart';

Future<List<AlbumModel>> albumsRepo({required int userId}) async {
  final albumsData = await getAlbums(userId: userId) as List<dynamic>;
  if (albumsData.isEmpty) {
    return List.empty();
  }
  return albumsData
      .map<AlbumModel>((album) => AlbumModel.fromMap(album))
      .toList();
}
