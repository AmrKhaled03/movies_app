import 'package:get/get.dart';
import 'package:movies/controllers/wish_controller.dart';
import 'package:movies/models/users/movie_model.dart';

class HomeController extends GetxController {
  List<MovieModel> playingMovies = [];
  List<MovieModel> popularMovies = [];
  List<MovieModel> topMovies = [];
  List<MovieModel> upcomingMovies = [];
  WishController wishController = Get.find();
  @override
  void onInit() {
    super.onInit();

    dynamic response = Get.arguments;

    if (response != null) {
      if (response['playingMovies'] != null) {
        playingMovies = List<MovieModel>.from(response['playingMovies']);
      }
      if (response['popularMovies'] != null) {
        popularMovies = List<MovieModel>.from(response['popularMovies']);
      }
      if (response['topMovies'] != null) {
        topMovies = List<MovieModel>.from(response['topMovies']);
      }
      if (response['upcomingMovies'] != null) {
        upcomingMovies = List<MovieModel>.from(response['upcomingMovies']);
      }
    }
  }
}
