// laundry_binding.dart
import 'package:get/get.dart';
import '../controllers/laundry_controller.dart';

class LaundryBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize the AddLaundryController
    Get.lazyPut<AddLaundryController>(() => AddLaundryController());
  }
}
