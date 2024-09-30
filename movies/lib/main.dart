import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:movies/constants/app_strings.dart';
import 'package:movies/utils/app_bindings.dart';
import 'package:movies/views/screens/details_screen.dart';
import 'package:movies/views/screens/home_screen.dart';
import 'package:movies/views/screens/now_playing.dart';
import 'package:movies/views/screens/popular_screen.dart';
import 'package:movies/views/screens/splash_screen.dart';
import 'package:movies/views/screens/upcoming_screen.dart';
import 'package:movies/views/screens/wish_list_screen.dart';



void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: AppStrings.splashRoute, page: () => const SplashScreen()),
        GetPage(name: AppStrings.homeRoute, page: () => const HomeScreen()),
        GetPage(
            name: AppStrings.detailsRoute, page: () => const DetailsScreen()),
        GetPage(
            name: AppStrings.nowPlayingRoute, page: () => const NowPlaying()),
        GetPage(
            name: AppStrings.popularRoute, page: () => const PopularScreen()),
            GetPage(name: AppStrings.wishRoute, page: ()=>const WishListScreen()),
            GetPage(name: AppStrings.upRoute, page: ()=>const UpcomingScreen())

            

      ],
      initialBinding: AppBindings(),
      initialRoute: AppStrings.splashRoute,
    );
  }
}
