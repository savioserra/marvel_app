import 'package:marvel_app/core/models/abillities.dart';
import 'package:marvel_app/core/models/characteristics.dart';

class Character {
  String name;
  String alterEgo;
  String imagePath;
  String biography;
  List<String> movies;
  Caracteristics caracteristics;
  Abilities abilities;

  Character({
    this.name,
    this.alterEgo,
    this.imagePath,
    this.biography,
    this.caracteristics,
    this.abilities,
    this.movies,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    final caracteristics = json['caracteristics'] != null
        ? Caracteristics.fromJson(json['caracteristics'])
        : null;

    final abilities = json['abilities'] != null
        ? Abilities.fromJson(json['abilities'])
        : null;

    return Character(
      name: json['name'],
      abilities: abilities,
      alterEgo: json['alterEgo'],
      imagePath: json['imagePath'],
      biography: json['biography'],
      caracteristics: caracteristics,
      movies: json['movies'].cast<String>(),
    );
  }
}
