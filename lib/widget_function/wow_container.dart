import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'random_color.dart';

Widget _wow_container(){
  return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
    alignment: Alignment.center,
    color: getRandomColor(),
    height: 100,
    width: 100,
    child: const Text('second component'
      ,style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),

    ),
  );

}