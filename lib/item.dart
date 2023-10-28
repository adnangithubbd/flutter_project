import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: Padding(
        padding: EdgeInsets.all(4.0), // Adjust the padding amount as needed
        child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              height: 100,
              child: Center(
               child: Text(

                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            )
          )
        ),
      ),
    );
  }
}
