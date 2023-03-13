import 'package:fe_challenge/data/db/vehicle_image_virtual_db.dart';
import 'package:fe_challenge/data/repositories/vehicle_image_repository.dart';

import '../../../models/vehicle_image.dart';

class VehicleImageController {
  VehicleImageRepository _repository =
      VehicleImageRepository(VehicleImageVirtualDB());

  Future<VehicleImage?> findByOne(String vin) {
    return _repository.findByVin(vin);
  }

  Future<String?> getImagePath(String? vin) {
    return _repository.getImagePathByVin(vin!);
  }

  Future<List<VehicleImage>> getAllVehicleImages() {
    return _repository.getAllVehicleImages();
  }
}
