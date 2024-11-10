import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/laundry_item.dart';

class AddLaundryController extends GetxController {
  // Kontroler untuk input nama dan berat
  final TextEditingController nameController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  // Daftar laundry dan riwayat
  var laundryList = <LaundryItem>[].obs;
  var historyList = <LaundryItem>[].obs; // Daftar riwayat laundry
  var selectedServiceType = 'Reguler'.obs;

  // Harga untuk setiap jenis layanan
  final Map<String, double> servicePrices = {
    'Reguler': 5000.0, // Harga untuk Reguler
    'Express': 10000.0, // Harga untuk Express
  };

  // Fungsi untuk menambahkan data laundry
  void addLaundry() {
    String name = nameController.text;
    String weightText = weightController.text;

    // Validasi input
    if (name.isNotEmpty && weightText.isNotEmpty) {
      double? weight = double.tryParse(weightText);
      if (weight != null) {
        double price = servicePrices[selectedServiceType.value]! * weight;

        // Menambahkan data ke laundryList
        laundryList.add(LaundryItem(
          name: name,
          weight: weight,
          serviceType: selectedServiceType.value,
          price: price,
        ));

        // Mengosongkan field setelah data ditambahkan
        nameController.clear();
        weightController.clear();

        // Menampilkan notifikasi berhasil
        Get.snackbar("Sukses", "Data Laundry berhasil ditambahkan!");
      } else {
        // Menampilkan notifikasi jika berat tidak valid
        Get.snackbar("Error", "Mohon masukkan angka yang valid untuk berat!");
      }
    } else {
      // Menampilkan notifikasi jika nama atau berat kosong
      Get.snackbar("Error", "Nama dan berat pakaian tidak boleh kosong!");
    }
  }

  // Fungsi untuk menghapus laundry dan memindahkannya ke riwayat
  void deleteLaundry(LaundryItem item) {
    laundryList.remove(item);         // Hapus dari daftar laundry
    historyList.add(item);            // Tambahkan ke daftar riwayat
    Get.snackbar(
      "Sukses",
      "Pesanan laundry telah dipindahkan ke riwayat.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    weightController.dispose();
    super.onClose();
  }
}
