import 'package:flutter/material.dart';
import 'package:fringe_programme/widgets/fringe_app_bar.dart';

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
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text("Sponsors"),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("We couldn't do this without them"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text("Awards"),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("The best of Shaftesbury Fringe 2019"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.bug_report),
            title: Text("Acknowledgements"),
            trailing: Icon(Icons.chevron_right),
            subtitle: Text("Thank you to everyone who helped"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
