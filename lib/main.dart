import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/ItemWidget.dart';
import 'package:meta/meta.dart';
import 'package:new_project/item.dart';
import 'package:new_project/parallax/aapp.dart';
import 'package:new_project/sliverList/custom_scroll_iew.dart';
import 'package:new_project/test/anim.dart';
import 'package:new_project/test/data_show.dart';
import 'package:new_project/test/list_obj.dart';
import 'package:new_project/theme/my_theme.dart';
import 'package:new_project/two_pages.dart';
import 'package:new_project/util/new_custom.dart';
import 'custom_scroll_view.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as log;
import 'package:new_project/prod/product.dart';


void main(){
   //runApp(Show());
   //  runApp(Scroll());
 // runApp(ExpandedExample());
 // runApp(TabBarApp());

// runApp(const CupertinoApp(
//   title: 'Navigation Basics',
//   home: FirstRoute(),
//   debugShowCheckedModeBanner: false,
// ));

//runApp(anim());
// runApp(contain());

runApp(const MaterialApp(
  home: Page1(),
));
}
class Show extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My tile....',

      theme: myCustomTheme,
      home: Scaffold(
        appBar: AppBar(title: const Text('Posts',
        )),
        body: FutureBuilder<List<Map<String, dynamic>>>(

          future: fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  Center(
                child: Container(

                  child: Image.network('https://i.dummyjson.com/data/products/16/thumbnail.jpg',
                      width:200,height:200),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<Map<String, dynamic>> posts = snapshot.data!;
              var i=0;
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














































  Widget txt2(String text,Color color){
  return Text(text,style: TextStyle(color: color),);
    }


Future<List<Map<String, dynamic>>> fetchPosts() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));

  if (response.statusCode == 200) {
    List<dynamic> responseData =json.decode(response.body);

    List<Map<String, dynamic>> posts = List<Map<String, dynamic>>.from(responseData);

    return posts;
  } else {
    throw Exception('Failed to load post');
  }
}




Widget _single_post(String title,Color color){
  return Container(
    child: Text(title,style: TextStyle(
        // fontFamily:,
        color: color),),
  );
}



class Another extends StatelessWidget {
  const Another({super.key});

  @override
  Widget build(BuildContext context) {
     const title = 'Floating App Bar';
      const url='https://i.dummyjson.com/data/products/9/1.jpg';
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
              SliverAppBar(
              title: Text(title,style: TextStyle(color: Colors.black),),
              floating: true,
              flexibleSpace: Image.network(url,fit: BoxFit.cover,),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(title: Text('Item #$index')),
                childCount: itemList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _with_box() {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue,
                child: const Text(
                  'someText',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _layout() {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraints.minHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'some text',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Text(
              'second text',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Text(
              'third text',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ],
        ),
      ));
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
