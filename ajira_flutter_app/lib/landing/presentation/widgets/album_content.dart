import 'package:ajira_flutter_app/core/constants/constants.dart';
import 'package:ajira_flutter_app/core/constants/layouts/layouts.dart';
import 'package:ajira_flutter_app/core/constants/routes/routes.dart';
import 'package:ajira_flutter_app/core/network_checker.dart';
import 'package:ajira_flutter_app/landing/bloc/album_bloc/album_bloc.dart';
import 'package:ajira_flutter_app/landing/bloc/profile_bloc/profile_bloc.dart';
import 'package:ajira_flutter_app/landing/model/album_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumContent extends StatefulWidget {
  const AlbumContent({super.key});

  @override
  State<AlbumContent> createState() => _AlbumContentState();
}

class _AlbumContentState extends State<AlbumContent> {
  void onConnected({required AlbumModel album}) {
    Navigator.of(context).pushNamed(
      photosScreenRoute,
      arguments: album,
    );
  }

  void onNotConnected() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        showCloseIcon: true,
        content: Text(
          "Please turn on internet",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        BlocProvider.of<ProfileBloc>(context)
            .add(ProfileFetchEvent(id: defaultUserId));
        BlocProvider.of<AlbumBloc>(context)
            .add(AlbumFetchEvent(userId: defaultUserId));
      },
      child: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumInitial) {
            return const Center(
              child: Text("Please turn on network and pull to refresh."),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(kDefaultAllSidePadding),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: (state as AlbumFetchSuccess).albums.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () async {
                final result = await checkInternet();
                if (result) {
                  onConnected(album: state.albums[index]);
                } else {
                  onNotConnected();
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 10,
                    child: Container(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.3,
                      child: Icon(
                        Icons.folder_outlined,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        size: 50,
                        weight: 50,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(3.0)),
                  Text(
                    state.albums[index].title,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
