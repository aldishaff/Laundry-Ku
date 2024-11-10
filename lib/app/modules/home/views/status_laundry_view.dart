import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/app/modules/laundry/controllers/laundry_controller.dart';
import 'package:laundry/app/modules/laundry/models/laundry_item.dart';

class StatusLaundryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AddLaundryController controller = Get.find<AddLaundryController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Status Laundry"),
        backgroundColor: Colors.greenAccent,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.laundryList.isEmpty) {
            return const Center(
              child: Text(
                "Belum ada data laundry.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: controller.laundryList.length,
            itemBuilder: (context, index) {
              LaundryItem laundry = controller.laundryList[index];
              double price = laundry.serviceType == 'Reguler'
                  ? 5000 * laundry.weight
                  : 10000 * laundry.weight;

              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(laundry.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Berat: ${laundry.weight} kg"),
                      Text("Jenis Jasa: ${laundry.serviceType}"),
                      Text("Harga: Rp ${price.toStringAsFixed(0)}"), // Menampilkan harga
                    ],
                  ),
                  leading: const Icon(
                    Icons.local_laundry_service,
                    color: Colors.blueAccent,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () {
                      // Pindahkan item ke riwayat dan hapus dari daftar laundry
                      controller.deleteLaundry(laundry);
                    },
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
