import 'package:fringe_programme/models/fringe_location.dart';
import 'package:latlong/latlong.dart';

class Venue extends FringeLocation {
  final String venueName;
  final String space;
  final String address;
  final String outsideImage;
  final String insideImage;
  final int id;

  Venue(this.venueName, this.space, this.address, LatLng location, this.outsideImage,
      this.insideImage, this.id)
      : super(location: location);
}
