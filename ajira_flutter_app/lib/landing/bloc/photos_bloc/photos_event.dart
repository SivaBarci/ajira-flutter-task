part of 'photos_bloc.dart';

@immutable
sealed class PhotosEvent {}

final class PhotosFetchEvent extends PhotosEvent {
  final int albumId;
  PhotosFetchEvent({required this.albumId});
}
