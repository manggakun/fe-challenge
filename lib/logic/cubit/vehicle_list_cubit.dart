import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vehicle_list_state.dart';

class VehicleListCubit extends Cubit<VehicleListState> {
  VehicleListCubit() : super(VehicleListInitial());

  void loadVehicles() => emit(state);
}
