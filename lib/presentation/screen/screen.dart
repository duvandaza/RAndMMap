library screen;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_rickandmorty_map/common/theme/styles.dart';
import 'package:test_rickandmorty_map/domain/entities/characters_entities.dart';
import 'package:test_rickandmorty_map/presentation/screen/rickandmorty/providers/characters_controller.dart';
import 'package:test_rickandmorty_map/presentation/screen/rickandmorty/providers/characters_provider.dart';

import '../widgets/widget.dart';

part 'home_screen.dart';

//--------------------- Rick and morty ---------------------
part 'rickandmorty/characters_screen.dart';
part 'rickandmorty/character_detail_screen.dart';
part 'rickandmorty/favorite_characters_screen.dart';

//--------------------- Map ---------------------
part 'map/map_screen.dart';