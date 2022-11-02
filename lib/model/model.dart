// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
  final int id;
  final String title;
  final String url;

  PostModel({
    required this.id,
    required this.title,
    required this.url,
  });

  factory PostModel.fromJson(Map<String, dynamic> data) {
    return PostModel(id: data['id'], title: data['title'], url: data['url']);
  }
}
