import 'package:ajira_flutter_app/landing/model/photos_model.dart';
import 'package:ajira_flutter_app/landing/network/photos_provider.dart';

Future<List<PhotosModel>> photosRepo({required int albumId}) async {
  final photosData = await getPhotos(albumId: albumId) as List<dynamic>;
  if (photosData.isEmpty) {
    return List.empty();
  }
  return photosData
      .map<PhotosModel>(
        (photo) => PhotosModel.fromMap(photo as Map<String, dynamic>),
      )
      .toList();
}
