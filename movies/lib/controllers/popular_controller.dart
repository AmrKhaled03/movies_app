import 'package:get/get.dart';
import 'package:movies/models/users/movie_model.dart';

class PopularController extends GetxController {
  List<MovieModel> movies = Get.arguments;
}
