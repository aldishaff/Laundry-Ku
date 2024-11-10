class LaundryItem {
  final String name;
  final double weight;
  final String serviceType; // Menyimpan jenis layanan
  final double price; // Menyimpan harga berdasarkan jenis layanan

  LaundryItem({
    required this.name,
    required this.weight,
    required this.serviceType,
    required this.price,
  });
}
