import 'package:ajira_flutter_app/landing/model/photos_model.dart';
import 'package:ajira_flutter_app/landing/repo/photos_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosInitial()) {
    on<PhotosFetchEvent>((event, emit) async {
      try {
        emit(PhotosFetchLoading());
        final photos = await photosRepo(albumId: event.albumId);
        emit(PhotosFetchSuccess(photos: photos));
      } on DioException catch (e) {
        emit(PhotosFetchFailure(error: e.message ?? ""));
      } catch (e) {
        emit(PhotosFetchFailure(error: e.toString()));
      }
    });
  }
}
