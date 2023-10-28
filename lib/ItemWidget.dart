import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      child: SizedBox(
        height: 100,
        child: Center(

            child: Text(text)),
      ),
    );
  }
}