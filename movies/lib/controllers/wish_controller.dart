import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/constants/db_helper.dart';
import 'package:movies/models/users/movie_model.dart';
import 'package:movies/models/users/wish_model.dart';

class WishController extends GetxController {
  DbHelper dbHelper = DbHelper();
  List<WishModel> wishList = [];
  Future<void> getList() async {
    try {
      var data = await dbHelper.getData("SELECT * FROM Wish");
      wishList = data.map<WishModel>((e) {
        return WishModel(
          id: e['id'],
          title: e['title'],
          overview: e['overview'],
        );
      }).toList();
    } catch (e) {
      debugPrint("Error in getList(): $e");
    }
    update();
  }

  Future<void> addToWishList(MovieModel movie) async {
    try {
      bool exists = wishList.any((wish) => wish.title == movie.title);

      if (exists) {
        Get.snackbar(
          "Notice",
          "${movie.title} is already in your Wish List!",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        debugPrint("Inserting movie: ${movie.title}, ${movie.overview}");
        String sql =
            'INSERT INTO "Wish" ("title", "overview") VALUES ("${movie.title}", "${movie.overview}")';
        int newId = await dbHelper.insertData(sql);
        if (newId != -1) {
          debugPrint("Inserted record ID: $newId");
          wishList.add(WishModel(
              id: newId, title: movie.title, overview: movie.overview));

          Get.snackbar(
            "Success",
            "${movie.title} has been added to your Wish List!",
            snackPosition: SnackPosition.BOTTOM,
          );

          await getList(); // Refresh the list
        } else {
          debugPrint("Insertion failed!");
          Get.snackbar(
            "Error",
            "Failed to add movie to Wish List.",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      debugPrint("Error in addToWishList(): $e");
      Get.snackbar(
        "Error",
        "Failed to add movie to Wish List.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> deleteFromList({required int id}) async {
    try {
      int res = await dbHelper.deleteData('DELETE FROM "Wish" WHERE id = $id');
      if (res > 0) {
        wishList.removeWhere((e) => e.id == id);
        update();
        Get.snackbar("Success", "Deleted from your Wish List!");

      } else {
        Get.snackbar("Error", "No item found to delete.");
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Error", "Failed to delete movie from Wish List.");
    }
  }

  @override
  void onInit() {
    getList();
    super.onInit();
  }
}
