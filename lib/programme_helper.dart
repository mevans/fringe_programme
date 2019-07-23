import 'package:flutter/material.dart';
import 'package:fringe_programme/models/carpark.dart';
import 'package:fringe_programme/models/health_point.dart';
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

  static List<CarPark> saturdayCarParks = [
    CarPark("Barton Hill", LatLng(51.009331, -2.194557)),
    CarPark("Shaftesbury School", LatLng(51.003130, -2.190327)),
  ];

  static List<CarPark> sundayCarParks = [
    CarPark("Angel Lane", LatLng(51.006886, -2.194736)),
    CarPark("Bell Street", LatLng(51.007045, -2.197818)),
    CarPark("Shaftesbury School", LatLng(51.003130, -2.190327)),
    CarPark("Barton Hill", LatLng(51.009331, -2.194557)),
    CarPark("Abbey View", LatLng(51.003169, -2.190504)),
    CarPark("Football Club", LatLng(51.006384, -2.191345)),
    CarPark("Father's House", LatLng(51.007873, -2.189083)),
    CarPark("Longmead", LatLng(51.008870, -2.187749))
  ];

  static List<HealthPoint> healthPoints = [
    HealthPoint("Defibrillator", LatLng(51.007362, -2.195111)),
    HealthPoint("Defibrillator", LatLng(51.005732, -2.197306)),
    HealthPoint("H Walk In", LatLng(51.004780, -2.200334))
  ];

  static List<Venue> allVenues = [
    Venue(
        "Angola 76",
        "Inside",
        "Mutons Lane, SP78AD",
        LatLng(51.006605, -2.195694),
        "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_3.jpg",
        "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Angola76-bar-area-e1511782739751.jpg", 1),
    Venue(
        "Angola 76",
        "Outside Courtyard",
        "Mutons Lane, SP78AD",
        LatLng(51.006632, -2.195780),
        "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_3.jpg",
        "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_4a.jpg", 2),
    Venue(
        "Bell St United Church",
        "Church",
        "Bell St, SP78AR",
        LatLng(51.006867, -2.196685),
        "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/bell-street-church-outside.jpg",
        "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/12/Bell-Street-United-Church-inside.jpg", 5),
    Venue(
        "Bright Blooms",
        "Shop Floor",
        "14 Bell Street, SP78AE",
        LatLng(51.006911, -2.196449),
        "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_7.jpg",
        "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Bright-Blooms-inside.jpg", 4),
    Venue("Bupa Dental Care", "Garden", "SP78QH", LatLng(51.007683, -2.198424), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2019/01/BUPA-Dental-Care.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2019/01/BUPA-Dental-Care_performance-area.jpg", 33),
    Venue("British Legion Hall", "Community Hall", "SP78PY", LatLng(51.006637, -2.191542), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Shaftesbury-British-Legion-outside-2018.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Shaftesbury-British-Legion-inside-2018.jpg", 10),
    Venue("Coffee #1", "Ground Floor", "SP78JG", LatLng(51.005910, -2.197142), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/02/CoffeeNumber1_outside.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Coffee1-inside.jpg", 28),
    Venue("Costa Coffee", "", "SP78JE", LatLng(51.005588, -2.197345), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Costa-Coffee-outside.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Costa-Coffee-inside.jpg", 31),
    Venue("Father's House", "Foyer", "SP78PH", LatLng(51.008027, -2.189231), "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_10.jpg", "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_10a.jpg", 29),
    Venue("Father's House", "Meeting Room", "SP78PH", LatLng(51.008027, -2.189231), "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_10.jpg", "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_41A.jpg", 30),
    Venue("Gold Hill Museum", "Ground Floor", "SP78JW", LatLng(51.005735, -2.196867), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/gold-hill-museum-garden-room-outside.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/gold-hill-museum-garden-room-inside.jpg", 6),
    Venue("Grosvenor Arms Hotel", "Assembly Room", "SP78JA", LatLng(51.006121, -2.198003), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Grosvenor-Arms-outside.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Grosvenor-Assembly-Rooms-interior-e1511785379639.jpg", 20),
    Venue("Grosvenor Arms Hotel", "Courtyard", "SP78JA", LatLng(51.006064, -2.198107), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Grosvenor-Arms-outside.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Grosvenor-courtyard-e1511785255544.jpg", 21),
    Venue("Grosvenor Arms Hotel", "Snug", "SP78JA", LatLng(51.006064, -2.198107), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Grosvenor-Arms-outside.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Grosvenor-courtyard-e1511785255544.jpg", 34),
    Venue("High Street Bakery", "Cafe", "SP78AA", LatLng(51.006449, -2.194330), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/High-Street-Bakery-outside-e1511784000977.jpg", "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_17a.jpg", 11),
    Venue("Kings Arms", "Bar Area", "SP78JZ", LatLng(51.007126, -2.198274), "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_6.jpg", "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_6a.jpg", 22),
    Venue("Potting Shed", "Garden", "SP78JQ", LatLng(51.006402, -2.196265), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Potting-shed-outside-2-e1511785767212.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Potting-shed-outside-1.jpg", 24),
    Venue("Shaftesbury Abbey Museum And Garden", "Garden", "SP78JR", LatLng(51.005207, -2.198383), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Abbey-Gardens-2018.jpg", "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_5a.jpg", 3),
    Venue("Shaftesbury Art Centre", "Rutter Room Upstairs Hall", "SP78AR", LatLng(51.006512, -2.197167), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-arts-centre-outside.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-arts-centre-rutter-room.jpg", 25),
    Venue("Shaftesbury Art Centre", "Main Stage Apron", "SP78AR", LatLng(51.006618, -2.197229), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-arts-centre-outside.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-arts-centre-theatre-2.jpg", 26),
    Venue("Shaftesbury Art Centre", "Foyer", "SP78AR", LatLng(51.006618, -2.197229), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-arts-centre-outside.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-arts-centre-theatre-2.jpg", 36),
    Venue("Shaftesbury Football Club", "Function Room", "SP78PY", LatLng(51.006432, -2.190939), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-football-club-outside-2018.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-football-club-bar.jpg", 18),
    Venue("Shaftesbury Football Club", "Bar Area", "SP78PY", LatLng(51.006508, -2.191018), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-football-club-outside-2018.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/shaftesbury-football-club-bar-2.jpg", 19),
    Venue("Shaftesbury Wines", "Garden", "SP78JE", LatLng(51.006325, -2.194700), "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_29.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Shaftesbury-Wines-outside-2018.jpg", 17),
    Venue("Shaston Social Club", "Function Room", "SP78AW", LatLng(51.008028, -2.197298), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Shaston-Social-Club-outside-e1511784436144.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Shaston-Social-Club-inside.jpg", 7),
    Venue("Sloanes", "Main Floor", "SP78JU", LatLng(51.006187, -2.197704), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Sloanes-outside-2018.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Sloanes-inside-2018.jpg", 27),
    Venue("St. Peter's Church", "Church", "SP78JW", LatLng(51.005753, -2.196732), "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_22.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/St-Peters-Church-inside-2018.jpg", 14),
    Venue("St. Peter's Church", "Hall", "SP78JW", LatLng(51.005704, -2.196939), "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_23.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/St-Peters-Hall-inside-2018.jpg", 15),
    Venue("Swans Yard", "Courtyard", "SP78JR", LatLng(51.006421, -2.196384), "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_24.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Swans-Yard-outside-e1511784332390.jpg", 16),
    Venue("The Mitre", "The Back Room", "SP78JE", LatLng(51.005804, -2.196579), "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_19.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/Mitre-inside-Back-Room-2018.jpg", 12),
    Venue("The Mitre", "Garden Terrace", "", LatLng(51.005731, -2.196464), "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_19.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2018/11/the-mitre-inn-outside-terrace.jpg", 13),
    Venue("Ye Old Two Brewers", "Garden", "SP78HE", LatLng(51.003369, -2.198398), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/two-brewers-outside.jpg", "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_32a.jpg", 8),
    Venue("Ye Old Two Brewers", "Skittle Alley", "SP78HE", LatLng(51.003452, -2.198511), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/two-brewers-outside.jpg", "http://www.shaftesburyfringe.co.uk/2017-venue-image/venue_13a.jpg", 9),
    Venue("Trinity Centre", "Upstairs Hall & Garden", "SP78BW", LatLng(51.005992, -2.198916), "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Trinity-Centre-outside.jpg", "http://www.shaftesburyfringe.co.uk/wp-content/uploads/2017/11/Trinity-Centre-inside.jpg", 23),
    Venue("Abbey Walk", "Rose Garden", "SP78JR", LatLng(51.004986, -2.198767), "https://www.shaftesburytourism.co.uk/wp-content/uploads/2016/11/1-2.jpg", "https://www.shaftesburytourism.co.uk/wp-content/uploads/2016/11/1-2.jpg", 32),
    Venue("Willow", "", "SP7 8JS", LatLng(51.005904, -2.197747), "http://shaftesburyfringe.co.uk/wp-content/uploads/2019/03/Willow_outside.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2019/03/Willow_inside.jpg", 35),
    Venue("Hidden Pizza", "Buskers' Stage", "SP7 8JY", LatLng(51.006301, -2.197913), "http://shaftesburyfringe.co.uk/wp-content/uploads/2019/03/Hidden-Pizza_1.jpg", "http://shaftesburyfringe.co.uk/wp-content/uploads/2019/03/Hidden-Pizza_2.jpg", 37),
    Venue("Shaftesbury Town Hall", "", "SP7 8JE", LatLng(51.005741, -2.197167), "https://www.dorsets.co.uk/sites/default/files/photos/shaftesbury_town_hall.jpg", "", 38),
  ];

  static Venue getVenueFromName(String name) {
    return allVenues.firstWhere((v) => v.venueName == name || "${v.venueName} - ${v.space}" == name);
  }

  static Venue getVenueFromID(int id) {
    return allVenues.firstWhere((v) => v.id == id);
  }

//  static Venue getVenueFromID(int id) {
//    return allVenues.firstWhere((v) => v.id == id);
//  }
//
//  static Venue getVenueFromName(String name) {
//    return allVenues.firstWhere((v) => v.name == name);
//  }

  static String getShareText(String eventName, DateTime dateTime) {
    return "On ${["Friday", "Saturday", "Sunday"][dateTime.weekday-5]} ${dateTime.day}th July, I'm going to see $eventName at the Shaftesbury Fringe. www.shaftesburyfringe.co.uk";
  }
}
