import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  static ProductDetailsController get instance => Get.find();

  removeOne(x) {
    if (x > 1) {
      return x--;
    } else {
      return x;
    }
  }

  addOne(x) {
    return x++;
  }
}
