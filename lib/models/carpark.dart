import 'package:fringe_programme/models/fringe_location.dart';
import 'package:latlong/latlong.dart';

class CarPark extends FringeLocation {
  final String name;

  CarPark(this.name, LatLng location) : super(location: location);
}
