import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/constants/app_strings.dart';
import 'package:movies/controllers/wish_controller.dart';
import 'package:movies/models/users/movie_model.dart';

class CardWidget extends StatelessWidget {
  final MovieModel movie;

  const CardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final WishController wishController = Get.find();
    return InkWell(
      onTap: () async{

        Get.toNamed(AppStrings.detailsRoute, arguments: movie);
      },
      child: Card(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              Hero(
                tag: 'movie_${movie.id}_${movie.title}',
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.red),
                        onPressed: () {
                          wishController.addToWishList(movie);
                        },
                      )
                    ],
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
