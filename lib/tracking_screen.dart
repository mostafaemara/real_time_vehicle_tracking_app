import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_time_vehicle_tracking_app/tracking_cubit.dart';

import 'vehicle.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  late final BitmapDescriptor bitMap;

  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(
      30.372882,
      30.500178,
    ),
    zoom: 17,
  );

  @override
  void initState() {
    _loadBitMap();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<TrackingCubit>().init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TrackingCubit, List<Vehicle>>(
          builder: (context, state) => GoogleMap(
            myLocationButtonEnabled: false,
            mapType: MapType.terrain,
            initialCameraPosition: _cameraPosition,
            markers: _mapVehicleToMarks(state),
          ),
        ),
      ),
    );
  }

  Set<Marker> _mapVehicleToMarks(List<Vehicle> vehicles) {
    final markers = <Marker>{};
    for (final v in vehicles) {
      markers.add(Marker(
          markerId: MarkerId(v.id.toString()),
          icon: bitMap,
          position: LatLng(v.lat, v.lon)));
    }
    return markers;
  }

  void _loadBitMap() async {
    bitMap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(50, 50)),
      "assets/car.png",
    );
  }

  @override
  void dispose() {
    context.read<TrackingCubit>().dispose();
    super.dispose();
  }
}
