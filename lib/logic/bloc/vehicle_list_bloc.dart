import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fe_challenge/data/dataproviders/http/controller/vehicle_image_controller.dart';
import 'package:fe_challenge/data/models/vehicle_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../data/dataproviders/http/controller/vehicle_controller.dart';
import '../../data/models/vehicle.dart';

part 'vehicle_list_event.dart';
part 'vehicle_list_state.dart';

class VehicleListBloc extends Bloc<VehicleListEvent, VehicleListState> {
  final VehicleController _vehicleController;
  final VehicleImageController _vehicleImageController;

  VehicleListBloc(this._vehicleController, this._vehicleImageController)
      : super(VehicleListInitial()) {
    on<LoadVehicles>((event, emit) async {
      // initial
      emit(VehicleListInitial());
      // on fetching
      emit(VehicleListInProgress(message: 'Loading...'));
      // on success
      try {
        var vehicleList = await _vehicleController
            .getAllVehicles()
            .onError((error, stackTrace) => Future.error('error'));
        var vehicleImageList =
            await _vehicleImageController.getAllVehicleImages();
        List<Vehicle> vehicles = vehicleList
            .map((vehicle) => addImage(vehicle, vehicleImageList))
            .toList();
        print(vehicleList == []);

        if (vehicleList == [] || vehicleList == null) {
          emit(VehicleListFailure(message: 'Data unavailable'));
        }
        emit(VehicleListSuccess(vehicles: vehicles));
      } catch (e) {
        emit(VehicleListFailure(message: 'Error retrieving vehicles list'));
      }
    });
  }

  Vehicle addImage(Vehicle vehicle, List<VehicleImage> vehicleImages) {
    vehicle.imagePath =
        vehicleImages.firstWhere((item) => item.vin == vehicle.vin).imagePath;
    return vehicle;
  }
}
