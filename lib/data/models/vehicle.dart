import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final String? vin;
  final String? vehicleName;
  late final String? imagePath;

  Vehicle(this.vin, this.vehicleName, this.imagePath);

  Vehicle.fromJson(Map<String, String> vehicle)
      : vin = vehicle['vin'],
        vehicleName = vehicle['vehicleName'];

  @override
  List<Object?> get props => [vin, vehicleName];
}
