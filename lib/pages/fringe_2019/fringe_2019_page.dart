import 'package:flutter/material.dart';
import 'package:fringe_programme/fringe_programme_font_icons.dart';
import 'package:fringe_programme/widgets/fringe_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class Fringe2019Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0.0,
        flexibleSpace: FringeAppBar("2019"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
//          ListTile(
//            leading: Icon(Icons.account_balance_wallet),
//            title: Text("Sponsors"),
//            trailing: Icon(Icons.chevron_right),
//            subtitle: Text("We couldn't do this without them"),
//            onTap: () {},
//          ),
//          ListTile(
//            leading: Icon(Icons.bug_report),
//            title: Text("Acknowledgements"),
//            trailing: Icon(Icons.chevron_right),
//            subtitle: Text("Thank you to everyone who helped"),
//            onTap: () {},
//          ),
          ListTile(
            leading: Icon(Icons.public),
            title: Text("Website"),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("Shaftesbury Fringe Website"),
            onTap: () async {
              if (await canLaunch("http://www.shaftesburyfringe.co.uk")) {
                launch("http://www.shaftesburyfringe.co.uk");
              }
            },
          ),
          ListTile(
            leading: Icon(
              FringeProgrammeFont.facebook,
              color: Colors.blue,
            ),
            title: Text("Facebook"),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              if (await canLaunch(
                  "https://www.facebook.com/TheShaftesburyFringe/")) {
                launch("https://www.facebook.com/TheShaftesburyFringe/");
              }
            },
          ),
          ListTile(
            leading: Icon(
              FringeProgrammeFont.instagram,
              color: Colors.purple,
            ),
            title: Text("Instagram"),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              if (await canLaunch(
                  "https://www.instagram.com/shaftesburyfringe/")) {
                launch("https://www.instagram.com/shaftesburyfringe/");
              }
            },
          ),
          ListTile(
            leading: Icon(
              FringeProgrammeFont.twitter,
              color: Colors.lightBlue,
            ),
            title: Text("Twitter"),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              if (await canLaunch("https://twitter.com/shaftesfringe")) {
                launch("https://twitter.com/shaftesfringe");
              }
            },
          ),
          ListTile(
            leading: Image.network(
              "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto/gigs/103934860/original/d2a1463c6c8a6ec4d258f698ae7d539a9129cf88/create-your-youtube-channel-art-and-logo.png",
              width: 32,
              height: 32,
            ),
            title: Text("YouTube"),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              if (await canLaunch(
                  "https://www.youtube.com/channel/UCe-mAIa8yniOdxzmC3Gs3Ag")) {
                launch(
                    "https://www.youtube.com/channel/UCe-mAIa8yniOdxzmC3Gs3Ag");
              }
            },
          ),
        ],
      ),
    );
  }
}
