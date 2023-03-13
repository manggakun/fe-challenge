import 'package:fe_challenge/data/models/vehicle_image.dart';

class VehicleImageVirtualDB {
  List<Map<String, String>> _vehicleImages = [
    {'vin': 'VIN1', 'imagePath': 'assets/images/VIN1.png'},
    {'vin': 'VIN2', 'imagePath': 'assets/images/VIN2.png'},
    {'vin': 'VIN3', 'imagePath': 'assets/images/VIN3.png'},
    {'vin': 'VIN4', 'imagePath': 'assets/images/VIN2.png'},
  ];
  static final VehicleImageVirtualDB _db =
      VehicleImageVirtualDB._privateConstructor();

  VehicleImageVirtualDB._privateConstructor();

  factory VehicleImageVirtualDB() {
    return _db;
  }

  Future<Map<String, String>> findByVin(String vin) async {
    await Future.delayed(Duration(milliseconds: 200));
    return _vehicleImages.firstWhere((item) => item['vin'] == vin);
  }

  Future<List<Map<String, String>>> getAll() async {
    await Future.delayed(Duration(milliseconds: 200));
    return _vehicleImages;
  }
}
