class Caracteristics {
  String birth;
  Weight weight;
  Height height;
  String universe;

  Caracteristics({this.birth, this.weight, this.height, this.universe});

  Caracteristics.fromJson(Map<String, dynamic> json) {
    birth = json['birth'];
    weight =
        json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
    height =
        json['height'] != null ? new Height.fromJson(json['height']) : null;
    universe = json['universe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birth'] = this.birth;
    if (this.weight != null) {
      data['weight'] = this.weight.toJson();
    }
    if (this.height != null) {
      data['height'] = this.height.toJson();
    }
    data['universe'] = this.universe;
    return data;
  }
}

class Weight {
  int value;
  String unity;

  Weight({this.value, this.unity});

  Weight.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unity = json['unity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['unity'] = this.unity;
    return data;
  }
}

class Height {
  double value;
  String unity;

  Height({this.value, this.unity});

  Height.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unity = json['unity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['unity'] = this.unity;
    return data;
  }
}
