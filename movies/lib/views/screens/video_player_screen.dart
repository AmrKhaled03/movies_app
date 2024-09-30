import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/constants/app_colors.dart';
import 'package:movies/constants/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPlayerScreen extends GetWidget {
  final String videoId;

  const VideoPlayerScreen({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final String url = 'https://www.youtube.com/watch?v=$videoId';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/movie update.jpg"),
          ),
        ),
        title: const Text(
          AppStrings.appTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppStrings.wishRoute);
              },
              icon: const Icon(
                Icons.favorite,
                color: AppColors.whitecolor,
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
        
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Color.fromARGB(255, 196, 178, 9))),
                  onPressed: () async {
                    // ignore: deprecated_member_use
                    if (await canLaunch(url)) {
                      // ignore: deprecated_member_use
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: const Text(
                    'Watch Trailer',
                    style: TextStyle(color: AppColors.whitecolor, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                  onPressed: () async {
                    Get.back();
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(color: AppColors.whitecolor, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
