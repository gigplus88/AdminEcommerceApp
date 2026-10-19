import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final Set<Polyline> polylineSet = {};
List<LatLng> polylineco = [];

final PolylinePoints polylinePoints = PolylinePoints(
  apiKey: 'AIzaSyChsdGd6-MbvIiFYoGA56Xlxxz5FTNUM5M',
);


Future<Set<Polyline>> getPolyLine(
  double lat,
  double long,
  double destLat,
  double destLong,
) async {
  final Set<Polyline> polylineSet = {};
  final PolylinePoints polylinePoints = PolylinePoints(
    apiKey: 'AIzaSyDEg3kEy5thJvUOm3wWOuxKYs-SxUjMCko',
  );

  try {
    final result = await polylinePoints.getRouteBetweenCoordinates(
      request: PolylineRequest(
        origin: PointLatLng(lat, long),
        destination: PointLatLng(destLat, destLong),
        mode: TravelMode.driving,
      ),
    );

    if (result.points.isEmpty) {
      debugPrint('No route points returned');
      return polylineSet;
    }

    List<LatLng> polylineco = result.points
        .map((point) => LatLng(point.latitude, point.longitude))
        .toList();

    polylineSet.add(
      Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.blue,
        width: 5,
        points: polylineco,
      ),
    );
  } catch (e) {
    debugPrint('Error getting route: $e');
  }

  return polylineSet;
}