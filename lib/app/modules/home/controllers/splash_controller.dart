// splash_controller.dart
import 'package:get/get.dart';
import 'package:laundry/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3));  // Durasi splash screen
    Get.offNamed(Routes.HOME);  // Arahkan ke halaman utama
  }
}
