part of 'album_bloc.dart';

@immutable
sealed class AlbumEvent {}

final class AlbumFetchEvent extends AlbumEvent {
  final int userId;
  AlbumFetchEvent({required this.userId});
}
