import 'package:flutter/material.dart';
import 'package:teslalogin/widgets/signUpWeb.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    BoxDecoration backgroundDecoration;
    double imageWidth;
    double imageHeight;

    if (currentWidth < 600) {
      imageWidth = 700.0;
      imageHeight = 1200.0;

      backgroundDecoration = const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/teslabenner02.jpg'),
          fit: BoxFit.cover,
          opacity: 0.8,
        ),
      );
    } else {
      imageWidth = 2500;
      imageHeight = 1500;

      backgroundDecoration = const BoxDecoration(
        color: Color.fromARGB(255, 218, 218, 218),
      );
    }

    return Scaffold(
      body: Container(
        width: imageWidth,
        height: imageHeight,
        decoration: backgroundDecoration,
        child: const SingleChildScrollView(
          child: Column(
            children: [SignUpWeb()],
          ),
        ),
      ),
    );
  }
}
