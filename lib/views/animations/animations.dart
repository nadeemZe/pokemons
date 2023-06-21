import 'package:flutter/material.dart';
import 'package:ossos_test/views/animations/widgets/bottom_row_shapes.dart';
import '../../constant/style_constant.dart';

class Animations extends StatefulWidget{
  final String yourName;
  const Animations({super.key,required this.yourName});

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  Color _color = blue;
  bool _circle = false;
  bool _radius = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Animations',
          style: appBarTextStyle,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.yourName,
              style: homeTextTextStyle,
            ),
            const SizedBox(height: 51,),
            AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _radius?BorderRadius.circular(30)
                                       :_circle?BorderRadius.circular(200):null,
                ),
            ),
            const Spacer(),
            BottomRowShapes(
                onTapSquare: (){
                  setState(() {
                    _color=blue;
                    _circle=false;
                    _radius=false;
                  });
                },
                onTapSquareRadius: (){
                  setState(() {
                    _color=lightBlue;
                    _radius=true;
                  });
                },
                onTapCircle: (){
                  setState(() {
                    _color=red;
                    _circle=true;
                    _radius=false;
                  });
                })
          ],
        ),
      ),
    );
  }
}