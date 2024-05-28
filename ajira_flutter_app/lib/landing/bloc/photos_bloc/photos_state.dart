part of 'photos_bloc.dart';

@immutable
sealed class PhotosState {}

final class PhotosInitial extends PhotosState {}

final class PhotosFetchSuccess extends PhotosState {
  final List<PhotosModel> photos;
  PhotosFetchSuccess({
    required this.photos,
  });
}

final class PhotosFetchFailure extends PhotosState {
  final String error;
  PhotosFetchFailure({required this.error});
}

final class PhotosFetchLoading extends PhotosState {}
