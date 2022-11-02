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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 13, mainAxisExtent: 96),
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
        Image.asset(url),
        Text(id),
        Text(title),
      ],
    );
  }
}
