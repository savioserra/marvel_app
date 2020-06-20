class Abilities {
  int force;
  int intelligence;
  int agility;
  int endurance;
  int velocity;

  Abilities({
    this.force,
    this.intelligence,
    this.agility,
    this.endurance,
    this.velocity,
  });

  factory Abilities.fromJson(Map<String, dynamic> json) {
    return Abilities(
      force: json['force'],
      intelligence: json['intelligence'],
      agility: json['agility'],
      endurance: json['endurance'],
      velocity: json['velocity'],
    );
  }
}
