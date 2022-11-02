import 'package:flutter/material.dart';
import 'package:http_homework/provider/provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PostProvider>();
    final vr = context.read<PostProvider>().getPosts();
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (context, index) => GridItem(
            id: vm.posts[index].id.toString(),
            title: vm.posts[index].title,
            url: vm.posts[index].url),
        itemCount: vm.posts.length,
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.id,
    required this.title,
    required this.url,
  });

  final String id;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(url),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(id),
            const SizedBox(height: 10),
            Text(
              title,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
