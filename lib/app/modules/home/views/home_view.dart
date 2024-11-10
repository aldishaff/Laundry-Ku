import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/app/modules/laundry/views/add_laundry_page.dart';
import 'package:laundry/app/modules/home/views/status_laundry_view.dart';
import 'package:laundry/app/modules/home/views/history_laundry_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LaundryKu",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2, // Adds spacing for a modern touch
          ),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Text
            const Text(
              "Selamat Datang di LaundryKu!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                letterSpacing: 1.5, // Adds spacing for readability
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Kami siap membantu merawat pakaian Anda agar selalu bersih dan wangi.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32),

            // Feature Buttons in GridView
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildFeatureButton(
                    icon: Icons.local_laundry_service,
                    label: "Order Laundry",
                    onTap: () {
                      Get.to(() => AddLaundryPage());
                    },
                    gradient: const LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  _buildFeatureButton(
                    icon: Icons.track_changes,
                    label: "Cek Status",
                    onTap: () {
                      Get.to(() => StatusLaundryView());
                    },
                    gradient: const LinearGradient(
                      colors: [Colors.greenAccent, Colors.lightGreen],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  _buildFeatureButton(
                    icon: Icons.history,
                    label: "Riwayat",
                    onTap: () {
                      Get.to(()=>HistoryLaundryView());
                    },
                    gradient: const LinearGradient(
                      colors: [Colors.orangeAccent, Colors.deepOrange],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  _buildFeatureButton(
                    icon: Icons.info,
                    label: "Info Member",
                    onTap: () {
                      Get.snackbar("Info", "Fitur ini akan segera hadir");
                    },
                    gradient: const LinearGradient(
                      colors: [Colors.purpleAccent, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddLaundryPage());
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildFeatureButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Gradient gradient,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 42, color: Colors.white), // Larger icon for visibility
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 1, // Adds spacing for clarity
              ),
            ),
          ],
        ),
      ),
    );
  }
}
