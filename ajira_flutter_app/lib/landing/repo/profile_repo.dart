import 'package:ajira_flutter_app/landing/model/profile_model.dart';
import 'package:ajira_flutter_app/landing/network/profile_provider.dart';

Future<ProfileModel> profileRepo({required int id}) async {
  final photosData = await getProfile(id: id) as List<dynamic>;
  if (photosData.isEmpty) {
    throw Exception("Invalid profile id");
  }
  return ProfileModel.fromMap(photosData[0] as Map<String, dynamic>);
}
