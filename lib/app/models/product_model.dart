import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final String img;
  final double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.img,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'img': img,
      'price': price
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        img: map['img'] ?? '',
        price: map['price']?.toDouble() ?? 0);
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
