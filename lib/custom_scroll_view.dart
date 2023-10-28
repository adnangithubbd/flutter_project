import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/test/list_obj.dart';

class MyApps extends StatelessWidget {
  final String url, title;

  const MyApps({super.key, required this.url, required this.title });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Custom appbar text... ',
            style: TextStyle(color: Colors.lightGreen),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            // Add the app bar to the CustomScrollView.
            SliverAppBar(
              title: Text(
                title,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: const TextStyle(color: Colors.black),
              ),
              floating: true,
              flexibleSpace: Image.network(url, fit: BoxFit.cover),
              expandedHeight: 200,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = itemList[index];
             return  ListTile(
                    leading: Image.network(
                      item.imageUrl,
                      height: 30,
                      width: 30,
                    ),
                    title: Text(item.title),
               // subtitle: ....... ,
             );
              },
              childCount: itemList.length,
            )),
          ],
        ),
      ),
    );
  }
}
