import 'package:flutter/material.dart';
import 'package:ossos_test/constant/style_constant.dart';

class GoToPage extends StatelessWidget{
  final Color color;
  final String text;
  final VoidCallback onTap;

  const GoToPage({super.key,required this.color,required this.text,required this.onTap});

  @override
  Widget build (BuildContext context){
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: goToPageTextStyle,
        ),
      ),
    );
  }
}