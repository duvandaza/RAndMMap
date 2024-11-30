import 'package:diacritic/diacritic.dart';
import 'package:mobx/mobx.dart';
import 'package:test_rickandmorty_map/common/utils/favorite_preference.dart';
import 'package:test_rickandmorty_map/domain/entities/characters_entities.dart';
import 'package:test_rickandmorty_map/infrastructure/datasources/api_characters_datasource.dart';
import 'package:test_rickandmorty_map/infrastructure/repositories/characters_repository_impl.dart';

part 'characters_provider.g.dart';

class CharactersStore = CharactersBase with _$CharactersStore;

abstract class CharactersBase with Store {

  final CharactersRepositoryImpl repository = CharactersRepositoryImpl(ApiCharactersDatasource());
  final favoritePreference = FavoritePreference();

  @observable
  ObservableList<CharactersModel> characters = ObservableList<CharactersModel>();

  @observable
  ObservableList<CharactersModel> favorites = ObservableList<CharactersModel>();

  @observable
  ObservableList<CharactersModel> filterCharacters = ObservableList<CharactersModel>();

  @action
  Future<void> fetchCharacters(int count) async {
    final data = await repository.getAllCharacter(count);
    characters = ObservableList.of(data);
    filterCharacters = ObservableList.of(data);
    await getFavorites();
  }

  @action
  void applyFilter(String text){
    if (text == '') {
      filterCharacters = characters;
    }else{
      String normalizedText = text.toLowerCase();
      filterCharacters = ObservableList.of(
        characters.where((character) {
          String normalizedName = removeDiacritics(character.name.toLowerCase());
          return normalizedName.contains(normalizedText);
        }).toList(),
      );
    }
  }

  @action
  Future<void> getFavorites() async {
    final data = await favoritePreference.getFavorite();
    List<CharactersModel> favoriteCharacters = characters.where((e) {
      return data.contains(e.id);
    }).toList();
    favorites = ObservableList.of(favoriteCharacters);
  }

  @action
  Future<bool> addFavorite(String id) async {
    final data = await favoritePreference.setFavorite(id);
    await getFavorites();
    return data;
  }

  @action
  Future<bool> deleteFavorite(String id) async {
    final data = await favoritePreference.removeFavorite(id);
    await getFavorites();
    return data;
  }

}