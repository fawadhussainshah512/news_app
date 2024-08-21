import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/views/home_screen.dart';
import '../utils/device_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to HomeScreen after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const HomeScreen());
    });

    return Scaffold(
      body: Container(
        width: DeviceInfo.getScreenWidth(context),
        height: DeviceInfo.getScreenHeight(context),
        color: kPrimaryColor,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NEWSIFY',
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
