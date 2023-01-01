import 'package:real_time_vehicle_tracking_app/vehicle.dart';
import 'package:web_socket_channel/io.dart';

class TrackingService {
  late IOWebSocketChannel _channel;

  void startTracking() {
    _channel = IOWebSocketChannel.connect(
        Uri.parse('ws://localhost:8080/fakeTracking'));
  }

  Future<void> stopTracking() async => _channel.sink.close();

  Stream<List<Vehicle>> get nearestVehicles =>
      _channel.stream.map((event) => vehicleFromJson(event));
}
