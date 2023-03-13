part of 'vehicle_list_cubit.dart';

@immutable
abstract class VehicleListState {}

class VehicleListInitial extends VehicleListState {}

class VehicleListInProgress extends VehicleListState {}

class VehicleListSuccess extends VehicleListState {}

class VehicleListFailure extends VehicleListState {}
