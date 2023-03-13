import 'package:equatable/equatable.dart';

class VehicleImage extends Equatable {
  final String? vin;
  final String? imagePath;

  VehicleImage(this.vin, this.imagePath);

  VehicleImage.fromJson(Map<String, String> vehicle)
      : vin = vehicle['vin'],
        imagePath = vehicle['imagePath'];

  @override
  List<Object?> get props => [vin, imagePath];
}
