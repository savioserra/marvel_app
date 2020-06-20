import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:marvel_app/core/models/character.dart';

class HeroesRepository {
  Map<String, List<Character>> _cache;

  Future<Map<String, List<Character>>> get cache async {
    if (_cache == null) {
      Map<String, List<Character>> newCache = {};

      final data = await rootBundle.loadString('assets/application.json').then(json.decode);

      for (var key in data.keys) {
        newCache[key] = List<Character>.from(data[key].map((chr) => Character.fromJson(chr)));
      }

      _cache = newCache;
    }

    return _cache;
  }

  Future<List<Character>> fetchHeroes() async {
    return cache.then((cache) => cache["heroes"]);
  }

  Future<List<Character>> fetchVilains() async {
    return cache.then((cache) => cache["vilains"]);
  }

  Future<List<Character>> fetchAntiHeroes() async {
    return cache.then((cache) => cache["antiHeroes"]);
  }

  Future<List<Character>> fetchAliens() async {
    return cache.then((cache) => cache["aliens"]);
  }

  Future<List<Character>> fetchHumans() async {
    return cache.then((cache) => cache["humans"]);
  }
}
