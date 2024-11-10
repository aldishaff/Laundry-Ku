import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/app/routes/app_pages.dart';
import 'app/modules/laundry/controllers/laundry_controller.dart';

void main() {
  runApp(MyApp());
  Get.put(AddLaundryController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LaundryKu',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
