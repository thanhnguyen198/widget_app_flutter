import 'package:flutter/material.dart';
import 'package:widget_app/colors/hexColor.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/splash.png'),
        Center(
          child: CircularProgressIndicator(color: HexColor.redNav),
        ),
      ],
    );
  }
}
