part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

final class PostsFetchSuccess extends PostsState {
  final List<PostModel> posts;
  PostsFetchSuccess({required this.posts});
}

final class PostsFetchLoading extends PostsState {}
