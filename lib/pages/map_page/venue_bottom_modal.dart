import 'package:flutter/material.dart';
import 'package:fringe_programme/models/venue.dart';
import 'package:fringe_programme/widgets/fringe_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VenuePage extends StatelessWidget {
  final Venue venue;

  VenuePage({this.venue});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: CachedNetworkImage(
                imageUrl: venue.outsideImage,
                placeholder: (ctx, _) =>
                    Center(child: CircularProgressIndicator()),
              )),
              Expanded(
                  child: CachedNetworkImage(
                imageUrl: venue.insideImage,
                placeholder: (ctx, _) =>
                    Center(child: CircularProgressIndicator()),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(venue.venueName, style: TextStyle(fontSize: 24)),
                      Text(venue.space, style: TextStyle(fontSize: 16)),
                      Text(venue.address,
                          style:
                              TextStyle(fontSize: 16, color: Colors.black38)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.navigation,
                          color: Theme.of(context).accentColor,
                        ),
                        onPressed: () => venue.navigateTo(context),
                      ),
                      Text("Take me there")
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 24)
        ],
      ),
    );
  }
}
