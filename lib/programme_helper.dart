import 'package:flutter/material.dart';
import 'package:fringe_programme/models/carpark.dart';
import 'package:fringe_programme/models/venue.dart';
import 'package:latlong/latlong.dart';

class ProgrammeHelper {
  static Map<String, Color> genres = {
    "Children's": Colors.lightGreen,
    "Comedy": Colors.blue,
    "Dance": Colors.yellow,
    "Exhibition": Colors.purple,
    "Music - Acoustic": Colors.redAccent,
    "Music - Opera & Classical": Colors.orange,
    "Music - Orchestra & Bands": Colors.deepOrange,
    "Music - Popular": Colors.red,
    "Poetry": Colors.brown,
    "Spoken Word": Colors.green,
    "Theatre": Colors.blueAccent,
    "Theatre - Musical": Colors.blueGrey,
    "Variety & Cabaret": Colors.lightBlue,
    "Other": Colors.cyan,
  };

  static List<CarPark> carParks = [
    CarPark("Barton Hill", LatLng(51.009331, -2.194557)),
    CarPark("Angel Street", LatLng(51.006886, -2.194736)),
    CarPark("Bell Street", LatLng(51.007045, -2.197818)),
    CarPark("Tesco Carpark", LatLng(51.006685, -2.192091))
  ];

  static List<Venue> allVenues = [
    Venue(
        "Angola 76",
        "Inside",
        "Mutons Lane, SP78AD",
        LatLng(51.006605, -2.195694),
        "http://shaftesburyfringe.co.uk/2017-venue-image/venue_3.jpg",
        "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Angola76-bar-area-e1511782739751.jpg"),
    Venue(
        "Angola 76",
        "Outside Courtyard",
        "Mutons Lane, SP78AD",
        LatLng(51.006632, -2.195780),
        "http://shaftesburyfringe.co.uk/2017-venue-image/venue_3.jpg",
        "http://shaftesburyfringe.co.uk/2017-venue-image/venue_4a.jpg"),
    Venue(
        "Bell St United Church",
        "Church",
        "Bell St, SP78AR",
        LatLng(51.006867, -2.196685),
        "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/bell-street-church-outside.jpg",
        "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/12/Bell-Street-United-Church-inside.jpg"),
    Venue(
        "Bright Blooms",
        "Shop Floor",
        "14 Bell Street, SP78AE",
        LatLng(51.006911, -2.196449),
        "http://shaftesburyfringe.co.uk/2017-venue-image/venue_7.jpg",
        "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Bright-Blooms-inside.jpg"),
    Venue("Bupa Dental Care", "Garden", "SP78QH", LatLng(51.007683, -2.198424), "http://shaftesburyfringe.co.uk/wp-content/uploads/2019/01/BUPA-Dental-Care.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2019/01/BUPA-Dental-Care_performance-area.jpg"),
    Venue("Royal British Legion Hall", "Community Hall", "SP78PY", LatLng(51.006637, -2.191542), "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Shaftesbury-British-Legion-outside-2018.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Shaftesbury-British-Legion-inside-2018.jpg"),
    Venue("Coffee#1", "Ground Floor", "SP78JG", LatLng(51.005910, -2.197142), "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/02/CoffeeNumber1_outside.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Coffee1-inside.jpg"),
    Venue("Costa Coffee", "", "SP78JE", LatLng(51.005588, -2.197345), "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Costa-Coffee-outside.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Costa-Coffee-inside.jpg"),
    Venue("Father's House", "Foyer", "SP78PH", LatLng(51.008027, -2.189231), "http://shaftesburyfringe.co.uk/2017-venue-image/venue_10.jpg", "http://shaftesburyfringe.co.uk/2017-venue-image/venue_10a.jpg"),
    Venue("Father's House", "Meeting Room", "SP78PH", LatLng(51.008027, -2.189231), "http://shaftesburyfringe.co.uk/2017-venue-image/venue_10.jpg", "http://shaftesburyfringe.co.uk/2017-venue-image/venue_41A.jpg"),
    Venue("Gold Hill Museum", "Ground Floor", "SP78JW", LatLng(51.005735, -2.196867), "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/gold-hill-museum-garden-room-outside.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/gold-hill-museum-garden-room-inside.jpg"),
    Venue("Grosvenor Arms Hotel", "Assembly Room", "SP78JA", LatLng(51.006121, -2.198003), "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Grosvenor-Arms-outside.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Grosvenor-Assembly-Rooms-interior-e1511785379639.jpg"),
    Venue("Grosvenor Arms Hotel", "Courtyard", "SP78JA", LatLng(51.006064, -2.198107), "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Grosvenor-Arms-outside.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Grosvenor-courtyard-e1511785255544.jpg"),
    Venue("High Street Bakery", "Cafe", "SP78AA", LatLng(51.006449, -2.194330), "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/High-Street-Bakery-outside-e1511784000977.jpg", "http://shaftesburyfringe.co.uk/2017-venue-image/venue_17a.jpg"),
    Venue("Kings Arms", "Bar Area", "SP78JZ", LatLng(51.007126, -2.198274), "http://shaftesburyfringe.co.uk/2017-venue-image/venue_6.jpg", "http://shaftesburyfringe.co.uk/2017-venue-image/venue_6a.jpg"),
    Venue("Potting Shed", "Garden", "SP78JQ", LatLng(51.006402, -2.196265), "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Potting-shed-outside-2-e1511785767212.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Potting-shed-outside-1.jpg"),
    Venue("Shaftesbury Abbey Museum and Garden", "Garden", "SP78JR", LatLng(51.005207, -2.198383), "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Abbey-Gardens-2018.jpg", "http://shaftesburyfringe.co.uk/2017-venue-image/venue_5a.jpg"),
    Venue("Shaftesbury Art Centre", "Rutter Room Upstairs Hall", "SP78AR", LatLng(51.006512, -2.197167), "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-arts-centre-outside.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-arts-centre-rutter-room.jpg"),
    Venue("Shaftesbury Art Centre", "Main Stage Apron", "SP78AR", LatLng(51.006618, -2.197229), "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-arts-centre-outside.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-arts-centre-theatre-2.jpg"),
    Venue("Shaftesbury Football Club", "Function Room", "SP78PY", LatLng(51.006432, -2.190939), "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-football-club-outside-2018.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-football-club-bar.jpg"),
    Venue("Shaftesbury Football Club", "Bar Area", "SP78PY", LatLng(51.006508, -2.191018), "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-football-club-outside-2018.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-football-club-bar-2.jpg"),
    Venue("Shaftesbury Wines", "Garden", "SP78JE", LatLng(51.006325, -2.194700), "http://shaftesburyfringe.co.uk/2017-venue-image/venue_29.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Shaftesbury-Wines-outside-2018.jpg"),
    Venue("Shaston Social Club", "Function Room", "SP78AW", LatLng(51.008028, -2.197298), "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Shaston-Social-Club-outside-e1511784436144.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Shaston-Social-Club-inside.jpg"),
    Venue("Sloanes", "Main Floor", "SP78JU", LatLng(51.006187, -2.197704), "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Sloanes-outside-2018.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Sloanes-inside-2018.jpg"),
    Venue("St. Peter's Church", "Church", "SP78JW", LatLng(51.005753, -2.196732), "http://shaftesburyfringe.co.uk/2017-venue-image/venue_22.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/St-Peters-Church-inside-2018.jpg"),
    Venue("St. Peter's Church", "Hall", "SP78JW", LatLng(51.005704, -2.196939), "http://shaftesburyfringe.co.uk/2017-venue-image/venue_23.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/St-Peters-Hall-inside-2018.jpg"),
    Venue("Swans Yard", "Courtyard", "SP78JR", LatLng(51.006421, -2.196384), "http://shaftesburyfringe.co.uk/2017-venue-image/venue_24.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Swans-Yard-outside-e1511784332390.jpg"),
    Venue("The Mitre", "The Back Room", "SP78JE", LatLng(51.005804, -2.196579), "http://shaftesburyfringe.co.uk/2017-venue-image/venue_19.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Mitre-inside-Back-Room-2018.jpg"),
    Venue("The Mitre", "Garden Terrace", "", LatLng(51.005731, -2.196464), "http://shaftesburyfringe.co.uk/2017-venue-image/venue_19.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2018/11/the-mitre-inn-outside-terrace.jpg"),
    Venue("Ye Old Two Brewers", "Garden", "SP78HE", LatLng(51.003369, -2.198398), "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/two-brewers-outside.jpg", "http://shaftesburyfringe.co.uk/2017-venue-image/venue_32a.jpg"),
    Venue("Ye Old Two Brewers", "Skittle Alley", "SP78HE", LatLng(51.003452, -2.198511), "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/two-brewers-outside.jpg", "http://shaftesburyfringe.co.uk/2017-venue-image/venue_13a.jpg"),
    Venue("Trinity Centre", "Upstairs Hall & Garden", "SP78BW", LatLng(51.005992, -2.198916), "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Trinity-Centre-outside.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Trinity-Centre-inside.jpg"),
    Venue("Abbey Walk", "Rose Garden", "SP78JR", LatLng(51.004986, -2.198767), "https://www.shaftesburytourism.co.uk/wp-content/uploads/2016/11/1-2.jpg", "https://www.shaftesburytourism.co.uk/wp-content/uploads/2016/11/1-2.jpg"),
  ];

  static Venue getVenueFromName(String name) {
    return allVenues.firstWhere((v) => v.venueName == name || "${v.venueName} - ${v.space}" == name);
  }

//  static Venue getVenueFromID(int id) {
//    return allVenues.firstWhere((v) => v.id == id);
//  }
//
//  static Venue getVenueFromName(String name) {
//    return allVenues.firstWhere((v) => v.name == name);
//  }
}
