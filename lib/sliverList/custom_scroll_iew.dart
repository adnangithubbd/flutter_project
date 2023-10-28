import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class csview extends StatelessWidget {
  const csview({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Custom Scroll View Demo';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(

        appBar: AppBar(
          title: Text('tttIIle'),

          actions: [
            Container(
              margin: EdgeInsets.only(right: 16.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.orange, // Container background color
              ),
              child:const Center(
                  child: Icon(
                    Icons.alarm,
                    color: Colors.green,
                  )
              )
              ,
            ),

          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Sliver App Bar .. '),
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://i.dummyjson.com/data/products/4/thumbnail.jpg',
                  fit: BoxFit.cover,
                ),
                title: TextField(autocorrect: true),
              ),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, int index) {
                  return _data_card(
                      index, index + 1, 'title $index', 'body $index');
                },
                childCount: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _data_card(int id, int userId, String title, String body) {
  return Card(
    margin: EdgeInsets.all(4.0),
    child: ListTile(
      title: Text(
        'ID ${id}',
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _single_post('userId : ${userId}', _randomColor()),
          _single_post('Title : ${title}', _randomColor()),
          _single_post('Body ${body}', _randomColor()),
        ],
      ),
    ),
  );
}

Color _randomColor() {
  Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1,
  );
}

Future<List<Map<String, dynamic>>> fetchPosts() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));

  if (response.statusCode == 200) {
    List<dynamic> responseData = json.decode(response.body);

    List<Map<String, dynamic>> posts =
        List<Map<String, dynamic>>.from(responseData);

    return posts;
  } else {
    throw Exception('Failed to load post');
  }
}

class Show extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Posts')),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                  child: Image.network(
                      'https://i.dummyjson.com/data/products/16/thumbnail.jpg',
                      width: 200,
                      height: 200),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<Map<String, dynamic>> posts = snapshot.data!;

              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Column(
                    children: [
                      _single_post('id :: ${post['id']}', Colors.blue),
                      _single_post('userId ${post['userId']}', Colors.red),
                      _single_post('title ${post['title']}', Colors.green),
                      _single_post('body ${post['body']}', Colors.orange),
                    ],
                  );
                },
              );
            }
            return Center(child: Text('No data'));
          },
        ),
      ),
    );
  }
}

Widget _single_post(String title, Color color) {
  return Container(
    child: Text(
      title,
      style: TextStyle(color: color),
    ),
  );
}
