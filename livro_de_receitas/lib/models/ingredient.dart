class Ingredient {
  String _name;
  String _quantity;

  String get name => _name;
  String get quantity => _quantity;

  Ingredient(String name, String quantity) {
    _name = name;
    _quantity = quantity;
  }

  Ingredient.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _quantity = json['quantity'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    map['name'] = _name;
    map['quantity'] = _quantity;

    return map;
  }
}