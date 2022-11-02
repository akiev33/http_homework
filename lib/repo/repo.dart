import 'package:http/http.dart' as http;

class Repo {
  Future<http.Response> getPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    return await http.get(url);
  }
}
