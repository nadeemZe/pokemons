import 'package:flutter/material.dart';

import '../../../constant/style_constant.dart';

class BottomRowShapes extends StatelessWidget{
  final VoidCallback onTapSquare;
  final VoidCallback onTapSquareRadius;
  final VoidCallback onTapCircle;

  const BottomRowShapes({super.key,required this.onTapSquare,required this.onTapSquareRadius,required this.onTapCircle});

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onTapSquare,
          child: Container(
            color: blue,
            height: 51,
            width: 51,
          ),
        ),
        InkWell(
          onTap: onTapSquareRadius,
          child: Container(
            height: 51,
            width: 51,
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        InkWell(
          onTap: onTapCircle,
          child: Container(
            height: 51,
            width: 51,
            decoration: const BoxDecoration(
              color: red,
              shape: BoxShape.circle
            ),
          ),
        ),
      ],

    );
  }
}