import 'package:ajira_flutter_app/core/constants/constants.dart';
import 'package:ajira_flutter_app/core/constants/layouts/layouts.dart';
import 'package:ajira_flutter_app/core/constants/routes/routes.dart';
import 'package:ajira_flutter_app/core/network_checker.dart';
import 'package:ajira_flutter_app/landing/bloc/profile_bloc/profile_bloc.dart';
import 'package:ajira_flutter_app/post/bloc/posts_bloc/posts_bloc.dart';
import 'package:ajira_flutter_app/post/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsContent extends StatefulWidget {
  const PostsContent({super.key});

  @override
  State<PostsContent> createState() => _PostsContentState();
}

class _PostsContentState extends State<PostsContent> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsBloc>(context).add(
      PostsFetchEvent(
        userId: defaultUserId,
      ),
    );
  }

  void onConnected({required PostModel post}) {
    Navigator.of(context).pushNamed(
      commentsScreenRoute,
      arguments: post,
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
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<ProfileBloc>(context)
            .add(ProfileFetchEvent(id: defaultUserId));
        BlocProvider.of<PostsBloc>(context)
            .add(PostsFetchEvent(userId: defaultUserId));
      },
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsFetchLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is PostsFetchSuccess) {
            final posts = state.posts;
            return ListView.builder(
              padding: const EdgeInsets.all(kDefaultAllSidePadding),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  onTap: () async {
                    final result = await checkInternet();
                    if (result) {
                      onConnected(post: post);
                    } else {
                      onNotConnected();
                    }
                  },
                  title: Text(
                    post.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    post.body,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_down),
                );
              },
            );
          }
          return const Center(
            child: Text("Please turn on network and pull to refresh."),
          );
        },
      ),
    );
  }
}
