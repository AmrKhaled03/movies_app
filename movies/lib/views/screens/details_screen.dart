import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/constants/app_colors.dart';
import 'package:movies/constants/app_extensions.dart';
import 'package:movies/controllers/details_controller.dart';
import 'package:movies/models/users/trailer_model.dart';
import 'package:movies/views/screens/video_player_screen.dart';

class DetailsScreen extends GetWidget<DetailsController> {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'movie_${controller.movie.id}_${controller.movie.title}',
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500${controller.movie.backdropPath}",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.whitecolor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(Icons.arrow_back, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              pinned: true,
              shape: const Border(
                bottom: BorderSide(color: AppColors.whitecolor),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 20), // Adjust spacing
                      alignment: Alignment.center,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: AppColors.whitecolor),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500${controller.movie.posterPath}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Text(
                        controller.movie.title,
                        style: const TextStyle(
                          color: AppColors.whitecolor,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    20.gap,
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              List<TrailerModel> trailers = await controller.fetchMovieVideos(controller.movie.id);
                              if (trailers.isNotEmpty) {
                                Get.to(() => VideoPlayerScreen(videoId: trailers.first.key));
                              } else {
                                Get.snackbar("Info", "No trailers found");
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 196, 178, 9),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_circle_right,
                                    color: AppColors.whitecolor,
                                    size: 30,
                                  ),
                                  Text(
                                    "Trailer",
                                    style: TextStyle(
                                        color: AppColors.whitecolor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        10.gap,
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 179, 16, 5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '⭐',
                                  style: TextStyle(fontSize: 40),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "TMDB Vote Average",
                                      style: TextStyle(
                                          color: AppColors.whitecolor,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      controller.movie.voteAverage.toString(),
                                      style: const TextStyle(
                                        color: AppColors.whitecolor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.gap,
                    Text(
                      controller.movie.overview,
                      style: const TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic),
                    ),
                    20.gap,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.green),
                      alignment: Alignment.center,
                      child: Text(
                        " Release Date : ${controller.movie.releaseDate}",
                        style: const TextStyle(color: AppColors.whitecolor),
                      ),
                    ),
                    20.gap,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.orange),
                      alignment: Alignment.center,
                      child: Text(
                        " Original Title : ${controller.movie.originalTitle}",
                        style: const TextStyle(color: AppColors.whitecolor),
                      ),
                    ),
                    20.gap,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue),
                      alignment: Alignment.center,
                      child: Text(
                        " Language : ${controller.movie.originalLanguage}",
                        style: const TextStyle(color: AppColors.whitecolor),
                      ),
                    ),
                    20.gap,
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
