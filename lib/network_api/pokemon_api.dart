import 'package:http/http.dart' as http;


class PokemonApi {

  Future<http.Response> fetchPokemonsApi(nextUrl)async{
    try{
      Map<String, dynamic> parameters = {
        'limit': '10',
        'offset':'0'
      };
      var url = Uri.https('pokeapi.co', 'api/v2/pokemon/',parameters);
      if(nextUrl!=null)nextUrl=Uri.parse(nextUrl);
      //pagination call 10 items every time
      //first call nextUrl will be null so we call url after that we call nextUrl
      var response = await http.get(nextUrl??url,);
      return response;
    }on Exception catch(e){
      throw e.toString();
    }
  }

  Future<http.Response> fetchPokemonByNameApi({required String name})async{
    try{
      var url = Uri.https('pokeapi.co', 'api/v2/pokemon/$name');
      var response = await http.get(url,);
      return response;
    }on Exception catch(e){
      throw e.toString();
    }
  }


}
