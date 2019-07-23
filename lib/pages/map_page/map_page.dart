import 'package:flutter/material.dart';
import 'package:fringe_programme/models/carpark.dart';
import 'package:fringe_programme/models/health_point.dart';
import 'package:fringe_programme/models/venue.dart';
import 'package:fringe_programme/pages/map_page/venue_bottom_modal.dart';
import 'package:fringe_programme/programme_helper.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fringe_programme/widgets/fringe_app_bar.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() {
    return new MapPageState();
  }
}

class MapPageState extends State<MapPage>
    with AutomaticKeepAliveClientMixin<MapPage> {
  bool parkingMarkers = true;
  bool venueMarkers = true;
  double zoom = 15.8;
  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    DateTime day = DateTime(2019, 7, 7);
    List<CarPark> carparks = [];
    if (day == DateTime(2019, 7, 6)) {
      carparks = ProgrammeHelper.saturdayCarParks;
    } else if (day == DateTime(2019, 7, 7)) {
      carparks = ProgrammeHelper.sundayCarParks;
    }

    List<Marker> markers = [];
    for (Venue v in ProgrammeHelper.allVenues) {
      markers.add(
        Marker(
          width: 30.0,
          height: 30.0,
          point: v.location,
          builder: (ctx) => GestureDetector(
                onTap: () => showModalBottomSheet(
                    context: context, builder: (ctx) => VenuePage(venue: v)),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  curve: venueMarkers ? Curves.easeIn : Curves.easeOut,
                  opacity: venueMarkers ? 1 : 0,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor),
                    child: Center(
                      child: Text(
                        "${v.id}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
        ),
      );
    }
    for (CarPark c in carparks) {
      markers.add(
        Marker(
          point: c.location,
          builder: (ctx) {
            return GestureDetector(
              onTap: () {
                c.navigateTo(ctx);
              },
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                curve: parkingMarkers ? Curves.easeIn : Curves.easeOut,
                opacity: parkingMarkers ? 1 : 0,
                child: Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  child: Center(
                      child: Text(
                    "P",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            );
          },
        ),
      );
    }
    for (HealthPoint healthPoint in ProgrammeHelper.healthPoints) {
      markers.add(
        Marker(
          point: healthPoint.location,
          builder: (ctx) {
            return GestureDetector(
              onTap: () {
                healthPoint.navigateTo(ctx);
              },
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                curve: parkingMarkers ? Curves.easeIn : Curves.easeOut,
                opacity: parkingMarkers ? 1 : 0,
                child: Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                  child: Center(
                      child: Text(
                    healthPoint.name.substring(0, 1),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            );
          },
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FringeAppBar("Map"),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: LatLng(51.006636, -2.195213),
              zoom: zoom,
            ),
            layers: [
              TileLayerOptions(
                keepBuffer: 100,
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/matthewevansmapbox/cjrkoo7yw2xg82so9682456r2/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWF0dGhld2V2YW5zbWFwYm94IiwiYSI6ImNqaWtqMWozcjIyZm0zd295Y3EzeGplMTIifQ.fV0sa-JXF6qiVRgMyDW2Tw",
              ),
              MarkerLayerOptions(markers: markers)
            ],
          ),
          Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.only(left: 16, top: 64),
              padding: EdgeInsets.only(left: 32, right: 16),
              color: Colors.black38,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Parking",
                        style: TextStyle(color: Colors.white),
                      ),
                      Checkbox(
                          activeColor: Colors.blue,
                          value: parkingMarkers,
                          onChanged: (b) => setState(() => parkingMarkers = b))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Venues",
                        style: TextStyle(color: Colors.white),
                      ),
                      Checkbox(
                          value: venueMarkers,
                          onChanged: (b) => setState(() => venueMarkers = b))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
