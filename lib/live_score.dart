import 'package:flutter/material.dart';

class LiveScore extends StatefulWidget {
  const LiveScore({super.key});

  @override
  State<LiveScore> createState() => _LiveScoreState();
}

class _LiveScoreState extends State<LiveScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Live Score App",

            style: TextStyle(fontWeight: .bold, color: Colors.white),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(),
      );
  }
}
