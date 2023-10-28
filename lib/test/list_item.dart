import 'dart:convert';
import 'package:http/http.dart' as http;
class ListItem {
  final String imageUrl;
  final String title;
  ListItem(this.imageUrl, this.title);

}
class Item{
  final String userId,id,title,body;
  Item(this.userId,this.id,this.title,this.body);
}

Map<String, dynamic> parseJson(String jsonString) {
  final parsed = json.decode(jsonString);
  return parsed;
}

Future<List<Map<String, dynamic>>?> fetchPosts() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<Map<String, dynamic>> posts = List<Map<String, dynamic>>.from(data);
    return posts;
  } else {
    throw Exception('Failed to load posts');
  }
}


