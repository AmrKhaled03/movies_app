import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/constants/app_strings.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/users/movie_model.dart';

class ApiServices {
  Future<dynamic> get getPlayingMovies async => await _getPlayingMovies();
  Future<dynamic> _getPlayingMovies() async {
    final Uri url =
        Uri.parse("${AppStrings.nowPlaying}?api_key=${AppStrings.apiKey}");
    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> result = data['results'];
        return result.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<dynamic> get getPopular async => await _getPopular();
  Future<dynamic> _getPopular() async {
    final Uri url =
        Uri.parse("${AppStrings.popularMovies}?api_key=${AppStrings.apiKey}");
    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> result = data['results'];
        return result.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<dynamic> get getTop async => await _getTop();
  Future<dynamic> _getTop() async {
    final Uri url =
        Uri.parse("${AppStrings.topRated}?api_key=${AppStrings.apiKey}");
    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> result = data['results'];
        return result.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<dynamic> get getUpcoming async => await _getUpcoming();
  Future<dynamic> _getUpcoming() async {
    final Uri url =
        Uri.parse("${AppStrings.upComing}?api_key=${AppStrings.apiKey}");
    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> result = data['results'];
        return result.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
  
}
