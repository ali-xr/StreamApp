import 'package:flutter/material.dart';

class HeadPage extends StatefulWidget {
  const HeadPage({Key? key}) : super(key: key);

  @override
  _HeadPageState createState() => _HeadPageState();
}

class _HeadPageState extends State<HeadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      body: SafeArea(
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
