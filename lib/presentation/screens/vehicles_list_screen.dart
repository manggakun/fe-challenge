import 'package:fe_challenge/data/dataproviders/http/controller/vehicle_controller.dart';
import 'package:fe_challenge/data/dataproviders/http/controller/vehicle_image_controller.dart';
import 'package:fe_challenge/data/models/vehicle.dart';
import 'package:fe_challenge/logic/bloc/vehicle_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehiclesListScreen extends StatefulWidget {
  const VehiclesListScreen({super.key, required this.title});
  final String title;

  @override
  State<VehiclesListScreen> createState() => _VehiclesListScreenState();
}

class _VehiclesListScreenState extends State<VehiclesListScreen> {
  final VehicleController vehicleListController = VehicleController();
  final VehicleImageController vehicleImageController =
      VehicleImageController();

  Widget vehicleTemplate(Vehicle vehicle) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        children: <Widget>[
          // Image(image: AssetImage('assets/images/VIN1.png')),
          Image(image: AssetImage(vehicle.imagePath!)),
          Text(
            'VIN: ${vehicle.vin}',
            style: TextStyle(fontSize: 18.0, color: Colors.grey),
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Vehicle Name: ${vehicle.vehicleName}',
            style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VehicleListBloc(vehicleListController, vehicleImageController)
            ..add(LoadVehicles()),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<VehicleListBloc, VehicleListState>(
            builder: (context, state) {
              if (state is VehicleListInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is VehicleListInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is VehicleListSuccess) {
                List<Vehicle> vehicles = state.vehicles;
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: vehicles
                          .map((vehicle) => vehicleTemplate(vehicle))
                          .toList()),
                );
              } else if (state is VehicleListFailure) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return ErrorWidget(
                    'Error loading widget. Please contact the app developer.');
              }
            },
          ),
        ),
      ),
    );
  }
}
