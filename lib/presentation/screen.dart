library screen;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_rickandmorty_map/common/theme/styles.dart';
import 'package:test_rickandmorty_map/domain/entities/characters_entities.dart';
import 'package:test_rickandmorty_map/presentation/rickandmorty/providers/characters_controller.dart';
import 'package:test_rickandmorty_map/presentation/rickandmorty/providers/characters_provider.dart';

import 'widgets/widget.dart';

part 'home_screen.dart';

//--------------------- Rick and morty ---------------------
part 'rickandmorty/screen/characters_screen.dart';
part 'rickandmorty/screen/character_detail_screen.dart';
part 'rickandmorty/screen/favorite_characters_screen.dart';

//--------------------- Map ---------------------
part 'map/map_screen.dart';