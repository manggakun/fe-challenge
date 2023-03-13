import 'package:fe_challenge/data/db/vehicle_image_virtual_db.dart';
import 'package:fe_challenge/data/models/vehicle_image.dart';

class VehicleImageRepository {
  final VehicleImageVirtualDB _db;

  VehicleImageRepository(this._db);

  Future<VehicleImage?> findByVin(String vin) async {
    var item = await _db.findByVin(vin);
    return item != null ? VehicleImage.fromJson(item) : null;
  }

  Future<String?> getImagePathByVin(String vin) async {
    var item = await _db.findByVin(vin);
    return item != null ? item.values.first : null;
  }

  Future<List<VehicleImage>> getAllVehicleImages() async {
    var items = await _db.getAll();
    return items.map((item) => VehicleImage.fromJson(item)).toList();
  }
}
