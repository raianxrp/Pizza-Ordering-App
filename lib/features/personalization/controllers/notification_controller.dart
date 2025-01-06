import 'package:get/get.dart';
import 'package:pizza/common/widgets/loaders/loaders.dart';
import 'package:pizza/utils/local_storage/storage_utility.dart';

class NotificationController extends GetxController {
  static NotificationController get instance => Get.find();

  final RxBool sendNotifications = true.obs;
  final _storage = LocalStorage.instance();

  @override
  void onInit() {
    sendNotifications.value = _storage.readData('notifications');
    super.onInit();
  }

  void toggleNotifications(bool value) {
    sendNotifications.value = value;
    _storage.writeData('notifications', value);
    MyLoaders.customToast(
        message: 'Please restart the application for changes to take effect.');
  }
}
