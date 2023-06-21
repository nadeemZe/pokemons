import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ossos_test/views/pokemons/widgets/pokemon_card.dart';
import '../../constant/style_constant.dart';
import 'controller/pokemons_bloc.dart';

class Pokemons extends StatefulWidget{
  const Pokemons({super.key});

  @override
  State<Pokemons> createState() => _PokemonsState();
}

class _PokemonsState extends State<Pokemons> {
  final _scrollController=ScrollController();

  void _onScroll(){
    final max=_scrollController.position.maxScrollExtent;
    final current=_scrollController.offset;
    if(current >= (max * 0.7)){
      //request pokemons when almost scrolling reach max
      BlocProvider.of<PokemonsBloc>(context).add(GetPokemonsEvent());
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        title: Text(
          'Pokemons',
          style: appBarTextStyle,
        ),
      ),
      body: BlocBuilder<PokemonsBloc,PokemonsState>(
        builder: (context,state){
          if(state.status == PokemonsStatus.loading ){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state.status == PokemonsStatus.error){
            return Center(child: Text(state.errorMessage,style: clearTextStyle,),);
          }
          if(state.status == PokemonsStatus.success){
            return ListView.builder(
              controller: _scrollController,
              //stop loader at the bottom when no more pokemons to get
              itemCount: state.nextUrl==null?state.pokemons.length:state.pokemons.length+1,
                itemBuilder: (context,index){
                    //show loader when getting next pokemons
                    return index>= state.pokemons.length
                        ?const Center(child: CircularProgressIndicator())
                        :PokemonCard(
                              imageUrl: state.pokemons[index].imageUrl,
                               text: state.pokemons[index].name,
                           );
            });
          }
          else {
            return Center(child: Text('Some thing went wrong',style: clearTextStyle,),);
          }
        },
      ),
    );
  }
}