part of 'comments_bloc.dart';

@immutable
sealed class CommentsState {}

final class CommentsInitial extends CommentsState {}

final class CommentsFetchSuccess extends CommentsState {
  final List<CommentModel> comments;
  CommentsFetchSuccess({required this.comments});
}
