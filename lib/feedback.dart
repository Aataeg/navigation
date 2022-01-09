import 'package:flutter/material.dart';
import 'package:navigation/main.dart';


class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTest(),
      drawer: menuDrawer(context),
      body: Container(
        alignment: Alignment.center,
        child: Text('Обратная связь'),
      ),
      bottomNavigationBar: bottomNavBar(context),
    );
  }
}