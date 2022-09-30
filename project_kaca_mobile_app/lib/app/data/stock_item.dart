import 'package:project_kaca_mobile_app/app/data/product_item.dart';
import 'dart:convert';

class StockItem {
  int? id;
  double? ketebalan;
  int? countProduct;
  DateTime? createdAt;
  DateTime? updatedAt;

  StockItem({
    this.id,
    required this.ketebalan,
    required this.countProduct,
    this.createdAt,
    this.updatedAt,
  });

  factory StockItem.fromMap(Map<String, dynamic> json) => StockItem(
        id: json["id"],
        ketebalan: json["ketebalan"],
        countProduct: json["countProduct"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"]).toLocal()
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"]).toLocal()
            : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "ketebalan": ketebalan,
        "countProduct": countProduct,
        "created_at": createdAt?.toIso8601String() ?? '',
        "updated_at": updatedAt?.toIso8601String() ?? '',
      };

  static List<ProductItem> stockItemsFromMap(List<dynamic> str) =>
      List<ProductItem>.from(str.map((x) => ProductItem.fromMap(x)));

  static String stockItemsToMap(List<ProductItem> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

  static List<StockItem> dataDummyList({int count = 20}) => List.generate(
        count,
        (index) => StockItem(
          id: index,
          ketebalan: 4.0 + (index / count),
          countProduct: index + 5,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now().add(Duration(days: count-index)),
        ),
      );
}
