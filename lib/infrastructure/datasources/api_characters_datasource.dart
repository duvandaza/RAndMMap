import 'dart:convert';

import 'package:test_rickandmorty_map/domain/datasources/characters_datasource.dart';
import 'package:test_rickandmorty_map/domain/entities/characters_entities.dart';
import 'package:http/http.dart' as http;

class ApiCharactersDatasource extends CharactersDatasource {
  
  @override
  Future<List<CharactersModel>> getAllCharacter(int count) async{
    
    List<CharactersModel> characters = [];
    List<int> ids = List<int>.generate(count, (i) => i + 1);
    String idsString = ids.join(',');

    try {
      final rest = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/$idsString'),
      );
      print(rest.statusCode);
      if(rest.statusCode == 200){
        List<dynamic> jsonData = json.decode(rest.body);
        characters = jsonData.map((item) => CharactersModel.fromJson(item)).toList();
      }
      return characters;
    } catch (e) {
      return characters;
    }
  }

  @override
  Future<List<CharactersModel>> getNameCharacter(String name) {
    // TODO: implement getNameCharacter
    throw UnimplementedError();
  }

}