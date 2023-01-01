import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
List<Vehicle> vehicleFromJson(String str) =>
    List<Vehicle>.from(json.decode(str).map((x) => Vehicle.fromMap(x)));

class Vehicle {
  final double lat;
  final double lon;
  final int id;
  Vehicle({
    required this.lat,
    required this.lon,
    required this.id,
  });

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      id: map['id'],
    );
  }

  factory Vehicle.fromJson(String source) =>
      Vehicle.fromMap(json.decode(source) as Map<String, dynamic>);
}
