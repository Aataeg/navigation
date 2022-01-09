import 'package:flutter/material.dart';
import 'package:navigation/main.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTest(),
      drawer: menuDrawer(context),
      body: Container(
        alignment: Alignment.center,
        child: Text('О нас'),
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }
}
