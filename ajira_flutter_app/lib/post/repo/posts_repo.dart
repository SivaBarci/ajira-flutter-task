import 'package:ajira_flutter_app/post/model/post_model.dart';
import 'package:ajira_flutter_app/post/network/posts_provider.dart';

Future<List<PostModel>> postsRepo({required int userId}) async {
  final postsData = await getPosts(userId: userId) as List<dynamic>;
  return postsData
      .map<PostModel>((post) => PostModel.fromMap(post as Map<String, dynamic>))
      .toList();
}
