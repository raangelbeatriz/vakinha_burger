import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final String img;

  ProductModel(this.id, this.name, this.description, this.img);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'img': img,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['description'] ?? '',
      map['img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
