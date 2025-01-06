import 'package:get/get.dart';
import 'package:pizza/data/repositories/pizza/pizza_repository.dart';
import 'package:pizza/features/shop/models/additional_ingredients_model.dart';

import '../../../common/widgets/loaders/loaders.dart';

class AdditionalIngredientController extends GetxController {
  static AdditionalIngredientController get instance => Get.find();

  final pizzaRepository = Get.put(PizzaRepository());
  final RxList<AdditionalIngredientsModel> ingredients =
      <AdditionalIngredientsModel>[].obs;

  @override
  void onInit() {
    getIngredients();
    super.onInit();
  }

  Future<void> getIngredients() async {
    try {
      final ingredient = await pizzaRepository.getAdditionalIngredients();
      ingredients.assignAll(ingredient);
    } catch (e) {
      MyLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
