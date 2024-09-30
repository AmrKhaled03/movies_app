import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/constants/app_strings.dart';

import 'package:movies/models/api/api_services.dart';

class SplashController extends GetxController {
  final ApiServices apiServices = ApiServices();

  @override
  void onInit() {
    super.onInit();
    fetchAllMovies();

  }

  Future<void> fetchAllMovies() async {
    try {
      final playingMovies = await apiServices.getPlayingMovies;
      final popularMovies = await apiServices.getPopular;
      final topMovies = await apiServices.getTop;
      final upcomingMovies = await apiServices.getUpcoming;

      await Future.delayed(const Duration(seconds: 3));

      Get.offNamed(
        AppStrings.homeRoute,
        arguments: {
          'playingMovies': playingMovies,
          'popularMovies': popularMovies,
          'topMovies': topMovies,
          'upcomingMovies': upcomingMovies,
        },
      );
    } catch (e) {
      debugPrint("Error fetching movies: $e");
    }
  }

}
