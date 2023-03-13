part of 'vehicle_list_bloc.dart';

@immutable
abstract class VehicleListEvent extends Equatable {
  const VehicleListEvent();
}

class LoadVehicles extends VehicleListEvent {
  @override
  List<Object?> get props => [];
}
