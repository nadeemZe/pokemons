import 'dart:convert';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ossos_test/network_api/pokemon_api.dart';
import '../model/pokemon_model.dart';

part 'pokemons_states.dart';
part 'pokemons_event.dart';


class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  PokemonsBloc() : super(const PokemonsState()) {
    on<PokemonsEvent>((event, emit) async {
      if (event is GetPokemonsEvent) {
        try {
          //first time calling status will be loading
          //second time calling status is success and nextUrl value will be the next url
          //when items ends nextUrl will be null and stop calling
          if (state.status == PokemonsStatus.loading || state.nextUrl!= null) {
            //get pokemons names
            await PokemonApi().fetchPokemonsApi(state.nextUrl).then((response) async {
              if(response.statusCode==200){
                final data= json.decode(response.body);
                final next=data['next'];
                final pokemonNameList=(data['results'] as List).map((pokemon)=>pokemon['name']).toList();

                final pokemonsList=[];
                //get image for every pokemon
                for(int i=0;i<pokemonNameList.length;i++){
                  await PokemonApi().fetchPokemonByNameApi(name: pokemonNameList[i]).then((responseDetail){
                    if(responseDetail.statusCode==200){
                      final pokemonDetail= json.decode(responseDetail.body);
                      String imageUrl = pokemonDetail['sprites']['front_default'];
                      //after getting the image we add pokemon to list
                      pokemonsList.add(PokemonModel(name: pokemonNameList[i],imageUrl: imageUrl));
                    }
                  });
                }

                emit(state.copyWith(
                  status: PokemonsStatus.success,
                  pokemons: [...state.pokemons,...pokemonsList],
                  nextUrl: next,
                ));
              }
              else{
                emit(state.copyWith(
                    status: PokemonsStatus.error, errorMessage: "failed to fetch pokemons"));
              }
            });
          }
        } catch (e) {
          emit(state.copyWith(
              status: PokemonsStatus.error, errorMessage: "failed to fetch pokemons"));
        }
      }
      //ignore any events added while an event is processing -> bloc_concurrency
      //prevent fetching items more than once
    }, transformer: droppable());
  }
}