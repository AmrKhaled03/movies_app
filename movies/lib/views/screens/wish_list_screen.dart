import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/constants/app_colors.dart';
import 'package:movies/constants/app_extensions.dart';
import 'package:movies/constants/app_strings.dart';
import 'package:movies/controllers/wish_controller.dart';

class WishListScreen extends GetWidget<WishController> {
  const WishListScreen({super.key});

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
              ),
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(color: AppColors.whitecolor),
                    children: [
                      const TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "ID",
                              style: TextStyle(
                                color: AppColors.whitecolor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Title",
                              style: TextStyle(
                                color: AppColors.whitecolor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Overview",
                              style: TextStyle(
                                color: AppColors.whitecolor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Action",
                              style: TextStyle(
                                color: AppColors.whitecolor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      // Dynamically build table rows based on wish list
                      for (var wish in controller.wishList)
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                wish.id.toString(),
                                style: const TextStyle(
                                  color: AppColors.whitecolor,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                wish.title,
                                style: const TextStyle(
                                  color: AppColors.whitecolor,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                wish.overview,
                                style: const TextStyle(
                                  color: AppColors.whitecolor,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  controller.deleteFromList(id: wish.id!);
                                  Get.offNamed(AppStrings.homeRoute);
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  20.gap,
                  TextButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "Back To Home",
                        style: TextStyle(
                            color: AppColors.whitecolor, fontSize: 25),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
