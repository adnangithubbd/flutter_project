import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/theme/my_theme.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 500,
        color: Colors.teal,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,

          children: [
            Container(
              width: 100,
              height: 100,

              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                 border: Border.all(width: 1,color: Colors.black),
                // gradient:   LinearGradient(colors: [
                //   Colors.blue,Colors.green,
                // ]),

                   boxShadow:const [
                   BoxShadow(color: Colors.purple ,blurRadius: 6)
                 ]
              ),
                  child: const Text('This is circule'),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                Navigator.of(context).push(_go());
                //    Navigator.push(
                //      context,
                //      MaterialPageRoute(builder: (context) => Page2()),
                //    );

                },
                child: const Text('Go!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////second page////////
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
      color: Colors.teal,

    ),

    );
  }
}
Widget _container(){

  return   Container(
    width: 100,
    height: 100,
    padding: const EdgeInsets.all(5),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1,color: Colors.black),
        // gradient:   LinearGradient(colors: [
        //   Colors.blue,Colors.green,
        // ]),

        boxShadow:const [
          BoxShadow(color: Colors.purple ,blurRadius: 6)
        ]
    ),
    child: const Text('This is circule'),
  );
}



Route _route(){
 return PageRouteBuilder(
     pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
     transitionsBuilder: ((context, animation, secondaryAnimation, child) => child));
}
Route _go(){
  return PageRouteBuilder(pageBuilder: ((context, animation, secondaryAnimation) => const Page2()),
  transitionsBuilder: (context, animation, secondaryAnimation, child){
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  });
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      return child;
    },
  );
}

Route _createRoute1(  ) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;


      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
     var colorTween = ColorTween(begin: Colors.transparent, end: Colors.black54);

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}



////opacity
class anim extends StatefulWidget {
  const anim({super.key});

  @override
  State<anim> createState() => _create();
}

class _create extends State<anim> {
  bool _isVisible = true;

  _update() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App title',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Appbar title'),
        ),
        body: Center(
          child: AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1000),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _update();
          },
          tooltip: 'Toggle opacity',
          child: const Icon(Icons.scanner),
        ),
      ),
    );
  }
}

//animation in container.....
class contain extends StatefulWidget {
  const contain({super.key});

  @override
  State<contain> createState() => _makeIt();
}

class _makeIt extends State<contain> {
  double _height = 50, _width = 40;
  Color _color = Colors.green;
  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  _update() {
    setState(() {
      Random random = Random();
      _height = random.nextInt(300).toDouble();
      _width = random.nextInt(300).toDouble();
      _color = Color.fromARGB(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title of container',
      theme: myCustomTheme,
      home: Scaffold(
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 1000),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _update();
          },
          child: Icon(Icons.update),
        ),
      ),
    );
  }
}
