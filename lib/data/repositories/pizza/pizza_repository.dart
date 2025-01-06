import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pizza/features/shop/models/additional_ingredients_model.dart';
import 'package:pizza/features/shop/models/pizza_model.dart';

class PizzaRepository extends GetxController {
  static PizzaRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance.collection('Pizzas');
  final _dbIngredients = FirebaseFirestore.instance.collection('Ingredients');
  final _dbAddOns = FirebaseFirestore.instance.collection('AddOns');

  Future<List<PizzaModel>> getPizzas() async {
    return await _db.get().then((data) => data.docs
        .map(
          (e) => PizzaModel.fromJson(e),
        )
        .toList());
  }

  Future<List<AdditionalIngredientsModel>> getAdditionalIngredients() async {
    return await _dbIngredients.get().then((data) => data.docs
        .map(
          (e) => AdditionalIngredientsModel.fromJson(e),
        )
        .toList());
  }

  Future<List<AdditionalIngredientsModel>> getAddOns() async {
    return await _dbAddOns.get().then((data) => data.docs
        .map(
          (e) => AdditionalIngredientsModel.fromJson(e),
        )
        .toList());
  }
}
