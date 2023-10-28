import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/test/list_obj.dart';

class test extends StatelessWidget{
  const test({super.key});
  @override
  Widget build(BuildContext context){
    const title='NNNothing to say';
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(title),
              floating: true,
              flexibleSpace: Image.network('',fit: BoxFit.cover,),
              expandedHeight: 200,
            ),
            SliverList( delegate: SliverChildBuilderDelegate(
                  (context, index){
                    final item=itemList[index];
                    ListTile(
                          leading: Image.network(item.imageUrl,height: 30,width: 30,),
                        title: Text('Item #$index'));
                  },
              childCount: itemList.length,

            )),
          ],
        ),
      ),

    );
  }
}