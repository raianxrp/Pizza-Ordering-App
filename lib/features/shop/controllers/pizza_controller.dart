import 'package:get/get.dart';
import 'package:pizza/data/repositories/pizza/pizza_repository.dart';
import 'package:pizza/features/shop/models/pizza_model.dart';

import '../../../common/widgets/loaders/loaders.dart';

class PizzaController extends GetxController {
  static PizzaController get instance => Get.find();

  final pizzaRepository = Get.put(PizzaRepository());
  final RxList<PizzaModel> pizzas = <PizzaModel>[].obs;

  @override
  void onInit() {
    getPizzas();
    super.onInit();
  }

  Future<void> getPizzas() async {
    try {
      final pizza = await pizzaRepository.getPizzas();
      this.pizzas.assignAll(pizza);
    } catch (e) {
      MyLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
