part of 'vehicle_list_bloc.dart';

// enum VehicleListStatus { initial, inProgress, success, failure }

// extension VehicleListX on VehicleListStatus {
//   bool get isInitial => this == VehicleListStatus.initial;
//   bool get isLoading => this == VehicleListStatus.inProgress;
//   bool get isSuccess => this == VehicleListStatus.success;
//   bool get isFailure => this == VehicleListStatus.failure;
// }

// @JsonSerializable
// class 

@immutable
abstract class VehicleListState extends Equatable {}

class VehicleListInitial extends VehicleListState {
  @override
  List<Object?> get props => [];
}

class VehicleListInProgress extends VehicleListState {
  final String message;
  VehicleListInProgress({required this.message});

  List<Object?> get props => [];
}

class VehicleListSuccess extends VehicleListState {
  final List<Vehicle> vehicles;
  VehicleListSuccess({required this.vehicles});
  
  @override
  List<Object?> get props => [vehicles];
}

class VehicleListFailure extends VehicleListState {
  final String message;
  VehicleListFailure({required this.message});
  
  @override
  List<Object?> get props => [];
}
