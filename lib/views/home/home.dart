import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ossos_test/constant/style_constant.dart';
import 'package:ossos_test/views/home/widgets/clear_widget.dart';
import 'package:ossos_test/views/home/widgets/go_to_page_widget.dart';
import 'package:ossos_test/views/pokemons/controller/pokemons_bloc.dart';
import 'package:ossos_test/views/pokemons/pokemons.dart';
import '../animations/animations.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   final TextEditingController _controller = TextEditingController();
   String _yourName = 'Your name';

   @override
   void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Home',
          style: appBarTextStyle,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter your name'
              ),
              onChanged: (name){
                setState(() {
                  _yourName = name;
                });
              },
            ),
            const SizedBox(height: 51,),
            Text(
              _yourName,
              style: homeTextTextStyle,
            ),
            const Spacer(),
            ClearTextWidget(
              onTap: (){
                setState(() {
                  _yourName = '';
                  _controller.text='';
                });
              },
            ),
            const SizedBox(height: 7,),
            GoToPage(
                color: blue,
                text: 'Go to page 1',
                onTap: (){
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context)=>Animations(yourName: _yourName,)));
                }
            ),
            const SizedBox(height: 7,),
            GoToPage(
                color: lightBlue,
                text: 'Go to page 2',
                onTap: (){

                  BlocProvider.of<PokemonsBloc>(context).add(GetPokemonsEvent());

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> const Pokemons()));
                }
                ),
          ],
        ),
      ),
    );
  }
}