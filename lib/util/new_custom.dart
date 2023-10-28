import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/theme/my_theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import '../style/text_style.dart';
import '/widget_function/random_color.dart';
import '../widget_function/views.dart';
import '/widget_function/wow_container.dart';
import '../widget_function/views.dart';

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[100],
          title: const Text('TabBar title (appbar)'),
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
            ),
          ]),
        ),
        body:   TabBarView(children: <Widget>[
          Center(
            child: TapLayout(),
          ),
          Center(
            child:TapLayout(),
          ),
          Center(
            child: TapLayout(),
          ),

        ]),
      ),
    );
  }
}

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expanded  Example",
      theme: custom_theme,
      home: Scaffold(
        appBar: AppBar(title: const Text('some text')),
        body: Column(
          children: [
            Text('style: Theme.of(context).textTheme.bodySmall ',
                style: Theme.of(context).textTheme.bodySmall),
            Text(
              'Some text  myCustomTheme.textTheme.bodyLarge ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Some text  myCustomTheme.textTheme.bodyLarge ',
            ),
          ],
        ),
      ),
    );
  }

  Widget tab() {
    return const TabBarView(children: [
      Icon(Icons.abc),
      Icon(Icons.car_crash),
      Icon(Icons.abc),
    ]);
  }
}

class Scroll extends StatelessWidget {
  var url = 'https://i.dummyjson.com/data/products/1/3.jpg';

  @override
  Widget build(BuildContext context) {
    const title = 'Floating app Bar';

    return MaterialApp(
      title: title,
      theme: myCustomTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center(
            child: Stack(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Image.network(
                      'https://i.dummyjson.com/data/products/1/thumbnail.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/img.png',
                      image: 'https://i.dummyjson.com/data/products/71/2.jpg',
                    ),
                  ),
                ],
              ),
            )
          ],
        )

            // child:Lottie.asset('assets/animations/anim1.json',
            //   height: 100,
            //   width: 100,
            //
            // ),
            ),
      ),
    );
  }

  Widget show() {
    return Lottie.network(
      'https://assets3.lottiefiles.com/packages/lf20_UJNc2t.json',
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    );
  }

  Widget hii() {
    return const Expanded(
        child: Row(
      children: [
        Expanded(
          child: Text(
            'this is some text',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: ''),
          ),
        )
      ],
    ));
  }
}

///////////////////////Foo/////////////////////////////////////////////
class Foo extends StatefulWidget {
  const Foo({super.key});

  @override
  State<Foo> createState() => _Responce();
}

class _Responce extends State<Foo> {
  final control = TextEditingController();
  late FocusNode myFocusNode;
  final url = 'https://i.dummyjson.com/data/products/1/3.jpg';
  bool isImageLoaded = false;

  @override
  void dispose() {
    control.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    control.addListener(_printLatestValue);
    myFocusNode = FocusNode();
    loadImage();
  }

  void _printLatestValue() {
    final text = control.text;
    print('Second text field:::::::::::: $text (${text.characters.length})');
  }

  Future<void> loadImage() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isImageLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type something you want... '),
            controller: control,
            onChanged: (text) {
              print('First text field: $text (${text.characters.length})');
            },
          ),
          FloatingActionButton(
            onPressed: () {
              var snackBar = SnackBar(
                content: const Text('Hey, this is a snack'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    const snackBar = SnackBar(
                      content: Text('The Process is undone... !'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Row(
                        children: [
                          Icon(Icons.sd_card_alert),
                          SizedBox(width: 8),
                          Text(control.text),
                        ],
                      ),
                    );
                  });
              myFocusNode.requestFocus();
            },
            tooltip: 'Show me the value!',
            child: const Icon(Icons.text_fields),
            elevation: 12,
          ),
          TextField(
            autofocus: true,
          ),
          TextField(
            focusNode: myFocusNode,
          ),
          Image.network(
            url,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////
class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter something...',
            ),
            controller: myController,
          ),
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(myController.text),
                  );
                },
              );
            },
            tooltip: 'Show me the value!',
            child: const Icon(Icons.text_fields),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////TapBoxA////////////////////////////////////////////

class TapboxA extends StatefulWidget {
  const TapboxA({super.key});

  @override
  State<StatefulWidget> createState() => _TapboxState();
}

class _TapboxState extends State<TapboxA> {
  bool _active = false;

  _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active ? Colors.green : Colors.red,
        ),
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////
class Listing extends StatefulWidget {
  const Listing({super.key});

  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  final items = List<String>.generate(5, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          key: Key(item),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });

            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$item dismissed')));
          },
          background: Container(color: Colors.red),
          child: ListTile(
            title: Text(item),
          ),
        );
      },
    );
  }
}

////////////////////////InkWell///////////////////////////////////////////

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          elevation: 12,
          content: Text('Tap'),
        ));
      },
      onDoubleTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('double tapped'),
        ));
      },
      child: Container(
          color: Colors.yellow,
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text('Flat Button'),
          )),
    );
  }
}

////////////////////////////////////MenuListItem/////////////////////////////////////////////////

class MenuListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MenuListItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Calls the onTap callback provided
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Row(
          children: <Widget>[
            Icon(icon),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////Gestures////////////////////////////////////////////

class Gestures extends StatefulWidget {
  const Gestures({super.key});

  @override
  State<StatefulWidget> createState() => _CreateGesture();
}

class _CreateGesture extends State<Gestures> {
  bool _isClicked = false;
  String clickInfo = 'Not clicked yet';
  int couter = 12;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isClicked) {
          clickInfo = 'Not clicked yet !!!! ';
        } else {
          clickInfo = 'Yes clicked';
          _isClicked = true;
          const snackBar = SnackBar(content: Text('Tapped  '));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12.12),
        ),
        child: Text('$clickInfo'),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<StatefulWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(
                    Icons.star,
                    size: Checkbox.width,
                  )
                : const Icon(
                    Icons.star_border,
                    size: Checkbox.width,
                  )),
            color: Colors.red[500],
            onPressed: () {
              _toggleFavorite();
            },
          ),
        ),
        SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.2),
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.green,
                  child: Text('$_favoriteCount likes ')),
            ))
      ],
    );
  }

  _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}

class Tap extends StatefulWidget {
  const Tap({super.key});

  @override
  State<StatefulWidget> createState() => _Tap();
}

class _Tap extends State<Tap> {
  int counter = 0;
  bool _isTapped = false;

  _tapDetector() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _tapDetector,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: _isTapped ? Colors.deepPurple : Colors.red,
        ),
        child: Text(
          //  _isTapped?'Activated ':'Deactivated'
          'Touch count $counter',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

///////////////////////////////Form//////////////////////////////////////
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
/////////////////////////////////

///////////////////////////////////////
