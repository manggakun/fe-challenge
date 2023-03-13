class VehicleVirtualDB {
  List<Map<String, String>> _vehicles = 
  [
    {'vin': 'VIN1', 'vehicleName': 'Vehicle Name 1'}, 
    {'vin': 'VIN2', 'vehicleName': 'Vehicle Name 2'}, 
    {'vin': 'VIN3', 'vehicleName': 'Vehicle Name 3'}, 
    {'vin': 'VIN4', 'vehicleName': 'Vehicle Name 4'}, 
  ];
  static final VehicleVirtualDB _db = VehicleVirtualDB._privateConstructor();

  VehicleVirtualDB._privateConstructor();

  factory VehicleVirtualDB() {
    return _db;
  }

  Future<List<Map<String, String>>> list() async {
    await Future.delayed(Duration(milliseconds: 800));
    return _vehicles;
  }
}
