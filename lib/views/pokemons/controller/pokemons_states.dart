part of 'pokemons_bloc.dart';

enum PokemonsStatus { loading, success, error }

class PokemonsState extends Equatable {
  final PokemonsStatus status;
  final List<PokemonModel> pokemons;
  final String? nextUrl;
  final String errorMessage;

  const PokemonsState(
      {this.status = PokemonsStatus.loading,
      this.pokemons = const [],
      this.nextUrl,
      this.errorMessage = ""});

  PokemonsState copyWith({
    PokemonsStatus? status,
    List<PokemonModel>? pokemons,
    String? nextUrl,
    String? errorMessage,
  }) {
    return PokemonsState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      nextUrl: nextUrl,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, pokemons,nextUrl, errorMessage];
}
