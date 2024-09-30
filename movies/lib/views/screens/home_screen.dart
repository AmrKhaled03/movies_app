import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/constants/app_colors.dart';
import 'package:movies/constants/app_extensions.dart';
import 'package:movies/constants/app_strings.dart';
import 'package:movies/controllers/home_controller.dart';
import 'package:movies/models/users/movie_model.dart';
import 'package:movies/views/widgets/card_widget.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

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
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Top Rated Movies (${controller.topMovies.length})",
                      style: const TextStyle(
                          color: AppColors.whitecolor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                20.gap,
                if (controller.topMovies.isNotEmpty)
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        MovieModel movie = controller.topMovies[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(AppStrings.detailsRoute,
                                arguments: movie);
                          },
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: AppColors.whitecolor)),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Hero(
                                    tag: 'movie_${movie.id}_${movie.title}',
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[800],
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Image not available',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                10.gap,
                                Column(
                                  children: [
                                    Text(
                                      movie.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: AppColors.whitecolor,
                                          fontSize: 15),
                                    ),
                                    10.gap,
                                    Text(
                                      '⭐ ${movie.voteAverage.toString()}',
                                      style: const TextStyle(
                                          color: AppColors.whitecolor),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const SizedBox(width: 10);
                      },
                      itemCount: controller.topMovies.length,
                    ),
                  )
                else
                  const Center(
                    child: Text(
                      'No movies available',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                20.gap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Now Playing (${controller.playingMovies.length})",
                        style: const TextStyle(
                            color: AppColors.whitecolor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    10.gap,
                    TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.green)),
                        onPressed: () {
                          Get.toNamed(AppStrings.nowPlayingRoute,
                              arguments: controller.playingMovies);
                        },
                        child: const Text(
                          "View More",
                          style: TextStyle(
                              color: AppColors.whitecolor, fontSize: 15),
                        ))
                  ],
                ),
                20.gap,
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (_, index) {
                    MovieModel movie = controller.playingMovies[index];
                    return CardWidget(movie: movie);
                  },
                  itemCount: controller.playingMovies.take(4).length,
                ),
                20.gap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Popular Movies (${controller.popularMovies.length})",
                        style: const TextStyle(
                            color: AppColors.whitecolor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    10.gap,
                    TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.green)),
                        onPressed: () {
                          Get.toNamed(AppStrings.popularRoute,
                              arguments: controller.popularMovies);
                        },
                        child: const Text(
                          "View More",
                          style: TextStyle(
                              color: AppColors.whitecolor, fontSize: 15),
                        ))
                  ],
                ),
                20.gap,
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.7, // Adjust aspect ratio if needed
                    ),
                    itemBuilder: (_, index) {
                      if (index < controller.popularMovies.length) {
                        MovieModel movie = controller.popularMovies[index];
                        return CardWidget(
                          movie: movie,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                    itemCount: controller.popularMovies.take(1).length,
                  ),
                ),
                20.gap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Coming Movies (${controller.popularMovies.length})",
                        style: const TextStyle(
                            color: AppColors.whitecolor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    10.gap,
                    TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.green)),
                        onPressed: () {
                          Get.toNamed(AppStrings.upRoute,
                              arguments: controller.upcomingMovies);
                        },
                        child: const Text(
                          "View More",
                          style: TextStyle(
                              color: AppColors.whitecolor, fontSize: 15),
                        ))
                  ],
                ),
                20.gap,
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.7, // Adjust aspect ratio if needed
                    ),
                    itemBuilder: (_, index) {
                      if (index < controller.upcomingMovies.length) {
                        MovieModel movie = controller.upcomingMovies[index];
                        return CardWidget(
                          movie: movie,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                    itemCount: controller.upcomingMovies.take(1).length,
                  ),
                ),
                20.gap,
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppColors.whitecolor),
                  ),
                  child: const Text(
                    "Made By Amr Khaled Marey",
                    style: TextStyle(
                        color: AppColors.whitecolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
