import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/app/modules/home/controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,  // Warna dasar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo laundry (misal berupa ikon pakaian atau mesin cuci)
            Icon(
              Icons.local_laundry_service,
              color: Colors.white,
              size: 100,
            ),
            SizedBox(height: 20),
            // Nama aplikasi dengan gaya modern
            Text(
              "LaundryKu",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            // Subtitle atau slogan
            Text(
              "Cuci Bersih, Wangi Harum",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 50),
            // Animasi loading modern
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
