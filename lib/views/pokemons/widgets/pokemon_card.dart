import 'package:flutter/material.dart';
import '../../../constant/style_constant.dart';

class PokemonCard extends StatelessWidget{
  final String imageUrl;
  final String text;
  const PokemonCard({super.key,required this.imageUrl,required this.text});

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 99,
      margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const[
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 3,
              offset:Offset(0,3)
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
              fit: BoxFit.cover,
              child: ClipRRect(
                borderRadius:BorderRadius.circular(12),
                child: Container(
                  color: Colors.grey,
                  child: Image.network(
                    imageUrl,
                    height: 99,
                    width: 99,
                    fit: BoxFit.cover,),
                ),
              )
          ),
          const SizedBox(width: 7,),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(text,style: homeTextTextStyle,),
          ),
        ],
      ),
    );
  }
}