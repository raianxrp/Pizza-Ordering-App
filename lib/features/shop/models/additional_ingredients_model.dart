import 'package:cloud_firestore/cloud_firestore.dart';

class AdditionalIngredientsModel {
  AdditionalIngredientsModel({
    required this.id,
    required this.price,
    required this.name,
    required this.image,
  });

  String id;
  String name;
  double price;
  String image;

  factory AdditionalIngredientsModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    if (data.isEmpty) return AdditionalIngredientsModel.empty();
    return AdditionalIngredientsModel(
      price: double.parse((data['Price'] ?? 0.0).toString()),
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      id: data['Id'] ?? '',
    );
  }

  static AdditionalIngredientsModel empty() =>
      AdditionalIngredientsModel(price: 0, image: '', name: '', id: '');

  toJson() {
    return {
      'Id': id,
      'Price': price,
      'Name': name,
      'Image': image,
    };
  }
}
