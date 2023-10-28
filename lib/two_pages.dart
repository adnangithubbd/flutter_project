import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('First Route'),
      ),
      child: Center(
        child: CupertinoButton(
          child: const Text('Open route'),
          onPressed: () async {

          final result=  await Navigator.push(
              context,
              CupertinoPageRoute(builder: (context)
              =>   const SecondRoute(text: 'Hello second')),
            );
          Text('send data is $result');
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  final String text;
 const SecondRoute({super.key,required this.text});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:   CupertinoNavigationBar(
        middle: Text(text),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pop(context,'Some data send from 2nd Screen');
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}