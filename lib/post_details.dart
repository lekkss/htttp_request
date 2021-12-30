import 'package:flutter/material.dart';

import 'model/post_model.dart';

class PostDetails extends StatelessWidget {
  final Post post;
  const PostDetails({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                color: Colors.blue[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: const Text("Title"),
                      subtitle: Text(post.title),
                    ),
                    ListTile(
                      title: const Text("ID"),
                      subtitle: Text("${post.id}"),
                    ),
                    ListTile(
                      title: const Text("Body"),
                      subtitle: Text(post.body),
                    ),
                    ListTile(
                      title: const Text("User ID"),
                      subtitle: Text("${post.userId}"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
