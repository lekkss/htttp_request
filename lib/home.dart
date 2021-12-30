import 'package:flutter/material.dart';
import 'package:http_practice/post_details.dart';
import 'package:http_practice/services/note_service.dart';

import 'model/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Posts"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView(
                children: posts!
                    .map(
                      (Post post) => Card(
                        color: Colors.blue[100],
                        child: ListTile(
                          title: Text(post.title),
                          subtitle: Text("${post.userId}"),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              await httpService.deletePost(post.id);
                            },
                          ),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostDetails(
                                post: post,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
