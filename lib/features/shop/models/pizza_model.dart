import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza/features/shop/models/macros_model.dart';

class PizzaModel {
  PizzaModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isVeg,
    required this.spicy,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros,
  });

  factory PizzaModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    if (data.isEmpty) return PizzaModel.empty();
    return PizzaModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      description: data['Description'] ?? '',
      isVeg: data['IsVeg'] ?? true,
      spicy: data['Spicy'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      discount: double.parse((data['Discount'] ?? 0.0).toString()),
      macros: MacrosModel.fromJson(data['Macros']),
    );
  }

  String description;
  String id;
  String image;
  bool isVeg;
  double price;
  double discount;
  MacrosModel macros;

  String name;
  int spicy;

  static PizzaModel empty() => PizzaModel(
        id: '',
        image: '',
        name: '',
        isVeg: true,
        spicy: 0,
        description: '',
        price: 0,
        discount: 0,
        macros: MacrosModel.empty(),
      );

  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsVeg': isVeg,
      'Spicy': spicy,
      'Description': description,
      'Price': price,
      'Discount': discount,
      'Macros': macros.toJson()
    };
  }
}
