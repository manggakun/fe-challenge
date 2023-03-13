import 'package:fe_challenge/data/db/vehicle_virtual_db.dart';
import 'package:http/http.dart';

import '../models/vehicle.dart';

class VehicleRepository {
  final VehicleVirtualDB _db;

  VehicleRepository(this._db);

  Future<List<Vehicle>> getAll() async {
    var items = await _db.list();
    return items.map((item) => Vehicle.fromJson(item)).toList();
  }
}
