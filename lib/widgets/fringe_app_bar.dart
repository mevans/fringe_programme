import 'package:flutter/material.dart';

class FringeAppBar extends StatelessWidget {
  final String text;
  FringeAppBar(this.text);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Image.asset(
                "assets/logos/fringetext.png",
                height: 25,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
