import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/constants/app_colors.dart';
import 'package:movies/constants/app_extensions.dart';
import 'package:movies/constants/app_strings.dart';
import 'package:movies/controllers/upcoming_controller.dart';
import 'package:movies/models/users/movie_model.dart';
import 'package:movies/views/widgets/card_widget.dart';

class UpcomingScreen extends GetWidget <UpcomingController>{
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return SafeArea(
        child: Scaffold(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (_, index) {
                  MovieModel movie = controller.movies[index];
                  return CardWidget(movie: movie);
                },
                itemCount: controller.movies.length,
              ),
              20.gap,
              TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green)),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(color: AppColors.whitecolor, fontSize: 15),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}