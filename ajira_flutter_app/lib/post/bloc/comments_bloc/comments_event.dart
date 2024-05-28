part of 'comments_bloc.dart';

@immutable
sealed class CommentsEvent {}

final class CommentsFetchEvent extends CommentsEvent {
  final int postId;
  CommentsFetchEvent({required this.postId});
}
