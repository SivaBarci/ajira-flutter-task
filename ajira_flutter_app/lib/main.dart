import 'package:ajira_flutter_app/core/app_bloc_observer.dart';
import 'package:ajira_flutter_app/core/constants/routes/routes.dart';
import 'package:ajira_flutter_app/core/route_generator.dart';
import 'package:ajira_flutter_app/landing/bloc/album_bloc/album_bloc.dart';
import 'package:ajira_flutter_app/landing/bloc/photos_bloc/photos_bloc.dart';
import 'package:ajira_flutter_app/landing/bloc/profile_bloc/profile_bloc.dart';
import 'package:ajira_flutter_app/post/bloc/comments_bloc/comments_bloc.dart';
import 'package:ajira_flutter_app/post/bloc/posts_bloc/posts_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const AjiraFlutterApp());
}

class AjiraFlutterApp extends StatelessWidget {
  const AjiraFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc()
            ..add(
              ProfileFetchEvent(id: 1),
            ),
        ),
        BlocProvider(
          create: (context) => AlbumBloc()
            ..add(
              AlbumFetchEvent(userId: 1),
            ),
        ),
        BlocProvider(
          create: (context) => PhotosBloc()
            ..add(
              PhotosFetchEvent(albumId: 1),
            ),
        ),
        BlocProvider(
          create: (context) => PostsBloc()
            ..add(
              PostsFetchEvent(userId: 1),
            ),
        ),
        BlocProvider(
          create: (context) => CommentsBloc()
            ..add(
              CommentsFetchEvent(postId: 1),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Ajira Flutter App',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        initialRoute: landingScreenRoute,
      ),
    );
  }
}
