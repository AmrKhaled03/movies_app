import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movies/constants/app_colors.dart';
import 'package:movies/constants/app_extensions.dart';
import 'package:movies/controllers/splash_controller.dart';

class SplashScreen extends GetWidget <SplashController>{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.passthrough,
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/movie update.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter, 
              child: Padding(
                padding: const EdgeInsets.only(bottom:35), 
                child: Column(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    const Text(
                      "Watch All Movies",
                      style: TextStyle(
                        color: AppColors.whitecolor,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    20.gap,
                    const Text(
                      "Download And Watch \n Offline Where You Are",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,

                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
