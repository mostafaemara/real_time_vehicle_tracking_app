import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_vehicle_tracking_app/tracking_service.dart';

import 'package:real_time_vehicle_tracking_app/vehicle.dart';

class TrackingCubit extends Cubit<List<Vehicle>> {
  TrackingCubit(this._trackingService) : super([]);
  final TrackingService _trackingService;
  void init() async {
    _trackingService.startTracking();
    _trackingService.nearestVehicles.listen((event) {
      emit(event);
    });
  }

  void dispose() {
    _trackingService.stopTracking();
  }
}
