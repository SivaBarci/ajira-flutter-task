import 'package:ajira_flutter_app/core/constants/layouts/layouts.dart';
import 'package:ajira_flutter_app/core/constants/routes/image_routes.dart';
import 'package:ajira_flutter_app/landing/bloc/photos_bloc/photos_bloc.dart';
import 'package:ajira_flutter_app/landing/model/album_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosScreen extends StatefulWidget {
  final AlbumModel album;
  const PhotosScreen({
    super.key,
    required this.album,
  });

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  late final AlbumModel album;
  @override
  void initState() {
    super.initState();
    album = widget.album;
    BlocProvider.of<PhotosBloc>(context)
        .add(PhotosFetchEvent(albumId: album.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          album.title,
        ),
      ),
      body: BlocBuilder<PhotosBloc, PhotosState>(
        builder: (context, state) {
          if (state is PhotosFetchSuccess) {
            final photos = state.photos;
            return ListView.builder(
              padding: const EdgeInsets.all(kDefaultAllSidePadding),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return ListTile(
                  contentPadding:
                      const EdgeInsets.all(kDefaultPhotosListPadding),
                  leading: FadeInImage.assetNetwork(
                      placeholder: musicIconUrl, image: photo.thumbnailUrl),
                  title: Text(
                    photo.title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                );
              },
            );
          }
          if (state is PhotosFetchFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is PhotosFetchLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const Center(
            child: Text("At intital"),
          );
        },
      ),
    );
  }
}
