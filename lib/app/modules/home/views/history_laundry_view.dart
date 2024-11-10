import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/app/modules/laundry/controllers/laundry_controller.dart';
import 'package:laundry/app/modules/laundry/models/laundry_item.dart';

class HistoryLaundryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AddLaundryController controller = Get.find<AddLaundryController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat Laundry"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.historyList.isEmpty) {
            return Center(
              child: Text(
                "Belum ada riwayat laundry.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: controller.historyList.length,
            itemBuilder: (context, index) {
              LaundryItem laundry = controller.historyList[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(laundry.name),
                  subtitle: Text(
                    "Berat: ${laundry.weight} kg\nLayanan: ${laundry.serviceType}\nHarga: Rp ${laundry.price.toStringAsFixed(0)}",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  leading: Icon(
                    Icons.history,
                    color: Colors.blueAccent,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
