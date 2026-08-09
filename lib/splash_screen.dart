import 'package:flutter/material.dart';
import 'package:live_score_app/live_score.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  Future<void> nextPage() async {
    await Future.delayed(Duration(seconds: 5));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LiveScore()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset('./assets/logo.png', width: 350),
            Text(
              "Find Every Match Live",
              style: TextStyle(
                fontSize: 22,
                fontWeight: .bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
