import 'package:flutter/material.dart';
import '../../../constant/style_constant.dart';

class ClearTextWidget extends StatelessWidget{
  final VoidCallback onTap;
  const ClearTextWidget({super.key,required this.onTap});

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.delete,color: red,size: 25,),
          const SizedBox(width: 5,),
          Text('Clear text',style: clearTextStyle,)
        ],
      ),
    );
  }
}