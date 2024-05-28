import 'package:ajira_flutter_app/landing/model/album_model.dart';
import 'package:ajira_flutter_app/landing/repo/albums_repo.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/foundation.dart';
part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends HydratedBloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumInitial()) {
    on<AlbumFetchEvent>((event, emit) async {
      try {
        final albums = await albumsRepo(userId: event.userId);
        emit(AlbumFetchSuccess(albums: albums));
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }

  @override
  AlbumState? fromJson(Map<String, dynamic> json) {
    // (json['albums'] as List<dynamic>).forEach(print);
    if (json.containsKey('albums') &&
        (json['albums'] as List<dynamic>).isNotEmpty) {
      return AlbumFetchSuccess(
          albums: (json['albums'] as List<dynamic>)
              .map((album) => AlbumModel.fromMap(album as Map<String, dynamic>))
              .toList());
    }
    return AlbumInitial();
  }

  @override
  Map<String, dynamic>? toJson(AlbumState state) {
    if (state is AlbumFetchSuccess) {
      // print(state.albums);
      return {'albums': state.albums.map((album) => album.toMap()).toList()};
    }
    return {'albums': []};
  }
}
