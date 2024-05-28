// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GeoModel {
  final String lat;
  final String lng;
  GeoModel({
    required this.lat,
    required this.lng,
  });

  GeoModel copyWith({
    String? lat,
    String? lng,
  }) {
    return GeoModel(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory GeoModel.fromMap(Map<String, dynamic> map) {
    return GeoModel(
      lat: map['lat'] as String,
      lng: map['lng'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoModel.fromJson(String source) =>
      GeoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GeoModel(lat: $lat, lng: $lng)';

  @override
  bool operator ==(covariant GeoModel other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}
