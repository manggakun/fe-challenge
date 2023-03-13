import 'package:fe_challenge/data/db/vehicle_virtual_db.dart';
import 'package:fe_challenge/data/repositories/vehicle_repository.dart';

import '../../../models/vehicle.dart';

class VehicleController {
  VehicleRepository _repository = VehicleRepository(VehicleVirtualDB());

  Future<List<Vehicle>> getAllVehicles() {
    return _repository.getAll();
  }
}
