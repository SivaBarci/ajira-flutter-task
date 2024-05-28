import 'package:ajira_flutter_app/post/model/post_model.dart';
import 'package:ajira_flutter_app/post/repo/posts_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends HydratedBloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsFetchEvent>((event, emit) async {
      try {
        final posts = await postsRepo(userId: event.userId);
        emit(PostsFetchSuccess(posts: posts));
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }

  @override
  PostsState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey('posts') &&
        (json['posts'] as List<dynamic>).isNotEmpty) {
      return PostsFetchSuccess(
          posts: (json['posts'] as List<dynamic>)
              .map((album) => PostModel.fromMap(album as Map<String, dynamic>))
              .toList());
    }
    return PostsInitial();
  }

  @override
  Map<String, dynamic>? toJson(PostsState state) {
    if (state is PostsFetchSuccess) {
      // print(state.albums);
      return {'posts': state.posts.map((album) => album.toMap()).toList()};
    }
    return {'posts': []};
  }
}
