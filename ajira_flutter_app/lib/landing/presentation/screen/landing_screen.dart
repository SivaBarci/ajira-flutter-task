import 'package:ajira_flutter_app/landing/presentation/widgets/album_content.dart';
import 'package:ajira_flutter_app/landing/presentation/widgets/custom_navigation_bar.dart';
import 'package:ajira_flutter_app/landing/presentation/widgets/location_info.dart';
import 'package:ajira_flutter_app/post/presentation/widgets/posts_content.dart';
import 'package:ajira_flutter_app/landing/presentation/widgets/profile_pic.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int currentPageIndex = 0;
  void onTap(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const AlbumContent();
    if (currentPageIndex == 1) {
      content = const PostsContent();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePic(),
            SizedBox(
              height: 4,
            ),
            LocationInfo(),
          ],
        ),
      ),
      body: content,
      bottomNavigationBar:
          CustomNavigationBar(currentIndex: currentPageIndex, onTap: onTap),
    );
  }
}
