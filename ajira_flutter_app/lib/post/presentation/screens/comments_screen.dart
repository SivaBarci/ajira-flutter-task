import 'package:ajira_flutter_app/core/constants/layouts/layouts.dart';
import 'package:ajira_flutter_app/post/bloc/comments_bloc/comments_bloc.dart';
import 'package:ajira_flutter_app/post/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsScreen extends StatefulWidget {
  final PostModel post;
  const CommentsScreen({super.key, required this.post});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late final PostModel post;
  @override
  void initState() {
    super.initState();
    post = widget.post;
    BlocProvider.of<CommentsBloc>(context)
        .add(CommentsFetchEvent(postId: post.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, state) {
          if (state is CommentsFetchSuccess) {
            final comments = state.comments;
            return ListView.builder(
              padding: const EdgeInsets.all(kDefaultAllSidePadding),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return ListTile(
                  contentPadding:
                      const EdgeInsets.all(kDefaultCommentsListPadding),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        "@${comment.email}",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    comment.body,
                  ),
                );
              },
            );
          }
          return const Text("At Initial");
        },
      ),
    );
  }
}
