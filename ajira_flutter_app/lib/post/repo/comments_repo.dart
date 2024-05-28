import 'package:ajira_flutter_app/post/model/comment_model.dart';
import 'package:ajira_flutter_app/post/network/comments_provider.dart';

Future<List<CommentModel>> commentsRepo({required int postId}) async {
  final commentsData = await getComments(postId: postId) as List<dynamic>;
  return commentsData
      .map<CommentModel>(
          (comment) => CommentModel.fromMap(comment as Map<String, dynamic>))
      .toList();
}
