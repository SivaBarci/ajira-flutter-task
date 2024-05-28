part of 'album_bloc.dart';

@immutable
sealed class AlbumState {}

final class AlbumInitial extends AlbumState {}

final class AlbumFetchSuccess extends AlbumState {
  final List<AlbumModel> albums;
  AlbumFetchSuccess({required this.albums});
}
