import 'package:get/get.dart';
import '../modules/home/bindings/splash_binding.dart';
import '../modules/home/views/splash_view.dart';
import 'package:laundry/app/modules/laundry/views/add_laundry_page.dart';
import 'package:laundry/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.ADD_LAUNDRY_PAGE,
      page: () => AddLaundryPage(),
    ),
  ];
}
