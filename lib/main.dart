import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_vehicle_tracking_app/tracking_cubit.dart';
import 'package:real_time_vehicle_tracking_app/tracking_screen.dart';
import 'package:real_time_vehicle_tracking_app/tracking_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final trackingService = TrackingService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Time Vehicle Tracking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TrackingCubit(trackingService),
        child: const TrackingScreen(),
      ),
    );
  }
}
