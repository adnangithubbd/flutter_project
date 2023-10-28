import 'package:flutter/material.dart';
import 'package:new_project/widget_function/random_color.dart';
class TapLayout extends StatefulWidget{
  const TapLayout({super.key});
  @override
  State<TapLayout> createState()=> _makeDynamic();
}

class _makeDynamic extends State<TapLayout> {
  bool _isTapped=false;
  _handleTap(){
    @override
      setState(VoidCallback fn) {

      _isTapped=!_isTapped;
      if(_isTapped){
        views(getRandomColor());
      }else{

      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        setState(() {
        _isTapped=!_isTapped;
        if(_isTapped){
          _showToast();
        }
        });
      },
      child: Container(
        child: views(Colors.green),
      ),
    );
  }




  Widget views(Color color){
    return  Center(
      child: ListView(
        children: <Widget>[
          Container(
            color: _isTapped? getRandomColor() :  getRandomColor(),//
            height: 100,
            width: 100,
            child: const Text('Some component ......'),
          ),

        ],
      ),
    );
  }
  _showToast(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('This is a snack bar!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

}



