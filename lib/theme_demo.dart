import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Data extends StatelessWidget{
   var appName='Custom themes';
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: appName,
        theme: ThemeData(
          useMaterial3: true,
           colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple,
           brightness: Brightness.dark,
           ),
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
              ),
            ),
        ),

    );
  }
}