
import 'package:fringe_programme/models/fringe_location.dart';
import 'package:latlong/latlong.dart';

class HealthPoint extends FringeLocation{
  final String name;
  final LatLng location;

  HealthPoint(this.name, this.location);

}