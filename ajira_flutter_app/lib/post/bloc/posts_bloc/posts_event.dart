part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

final class PostsFetchEvent extends PostsEvent {
  final int userId;
  PostsFetchEvent({required this.userId});
}
