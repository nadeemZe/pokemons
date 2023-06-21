import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ossos_test/views/pokemons/controller/pokemons_bloc.dart';
import 'package:ossos_test/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>PokemonsBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ossos test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen()
      ),
    );
  }
}
