import 'package:ajira_flutter_app/post/model/comment_model.dart';
import 'package:ajira_flutter_app/post/repo/comments_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(CommentsInitial()) {
    on<CommentsFetchEvent>((event, emit) async {
      try {
        final comments = await commentsRepo(postId: event.postId);
        emit(CommentsFetchSuccess(comments: comments));
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }
}
