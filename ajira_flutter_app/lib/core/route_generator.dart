import 'package:ajira_flutter_app/core/constants/routes/routes.dart';
import 'package:ajira_flutter_app/landing/model/album_model.dart';
import 'package:ajira_flutter_app/landing/presentation/screen/landing_screen.dart';
import 'package:ajira_flutter_app/landing/presentation/screen/photos_screen.dart';
import 'package:ajira_flutter_app/post/model/post_model.dart';
import 'package:ajira_flutter_app/post/presentation/screens/comments_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final route = settings.name;
    switch (route) {
      case landingScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        );
      case photosScreenRoute:
        {
          final AlbumModel album = (settings.arguments as AlbumModel);
          return MaterialPageRoute(
            builder: (context) => PhotosScreen(album: album),
          );
        }
      case commentsScreenRoute:
        {
          final PostModel post = (settings.arguments as PostModel);
          return MaterialPageRoute(
            builder: (context) => CommentsScreen(post: post),
          );
        }
      default:
        return MaterialPageRoute(
          builder: (context) => const PageNotImplemented(),
        );
    }
  }
}

class PageNotImplemented extends StatelessWidget {
  const PageNotImplemented({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Page not implemented"),
      ),
    );
  }
}
