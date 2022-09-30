import 'dart:convert';

class ProductItem {
  int? id;
  double? panjang;
  double? lebar;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductItem({
    this.id,
    required this.lebar,
    required this.panjang,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductItem.fromMap(Map<String, dynamic> json) => ProductItem(
        id: json["id"],
        panjang: json["panjang"],
        lebar: json["lebar"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"]).toLocal()
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"]).toLocal()
            : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "panjang": panjang,
        "lebar": lebar,
        "created_at": createdAt?.toIso8601String() ?? '',
        "updated_at": updatedAt?.toIso8601String() ?? '',
      };

  static List<ProductItem> productItemsFromMap(List<dynamic> str) =>
      List<ProductItem>.from(str.map((x) => ProductItem.fromMap(x)));

  static String productItemsToMap(List<ProductItem> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

  static List<ProductItem> dataDummyList({int count = 20}) => List.generate(
        count,
        (index) => ProductItem(
          id: index,
          panjang: 5.0 + index,
          lebar: 3.0 + index,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now().add(Duration(days: count - index)),
        ),
      );

  factory ProductItem.dataDummy() => ProductItem(
        id: 0,
        panjang: 5,
        lebar: 5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}
