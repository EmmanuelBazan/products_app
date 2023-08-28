import 'dart:convert';

class Product {
  bool available;
  String name;
  String description;
  String? picture;
  double price;
  String? id;

  Product({
    required this.available,
    required this.name,
    required this.price,
    required this.description,
    this.picture,
    this.id,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
        "description": description,
        "id": id,
      };

  Product copy() => Product(
        available: available,
        name: name,
        price: price,
        description: description,
        id: id,
        picture: picture,
      );
}
