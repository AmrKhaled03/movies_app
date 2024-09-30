import 'dart:convert';

import 'package:get/get.dart';
import 'package:movies/constants/app_strings.dart';
import 'package:movies/models/users/movie_model.dart';
import 'package:movies/models/users/trailer_model.dart';

import 'package:http/http.dart' as http;
class DetailsController extends GetxController {
  MovieModel movie = Get.arguments;
Future<List<TrailerModel>> fetchMovieVideos(int movieId) async {

    final String url =
        'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=${AppStrings.apiKey}';

    try {
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> videoResults = data['results'] ?? [];
        return videoResults.map((video) => TrailerModel.fromJson(video)).toList();
      } else {
        throw Exception('Failed to load videos');
      }
    } catch (e) {
      throw Exception('Error fetching videos: $e');
    }
  }
}
