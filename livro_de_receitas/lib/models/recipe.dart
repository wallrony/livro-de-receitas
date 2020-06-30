import 'package:livrodereceitas/models/ingredient.dart';

class Recipe {
  int _id;
  String _name;
  String _prepareDescription;
  String _time;
  List<Ingredient> _ingredients;

  int get id => _id;

  String get name => _name;

  String get prepareDescription => _prepareDescription;

  String get time => _time;

  List<Ingredient> get ingredients => _ingredients;

  Recipe(id, name, prepareDescription, time, ingredients) {
    _id = id;
    _name = name;
    _prepareDescription = prepareDescription;
    _time = time;
    _ingredients = ingredients;
  }

  Recipe.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _prepareDescription = json['prepareDescription'];
    _time = json['time'];
    _ingredients = json['ingredients'].map<Ingredient>(
      (object) => Ingredient.fromJson(object),
    ).toList();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    map['id'] = _id;
    map['name'] = _name;
    map['prepareDescription'] = _prepareDescription;
    map['time'] = _time;
    map['ingredients'] = _ingredients;

    return map;
  }
}
