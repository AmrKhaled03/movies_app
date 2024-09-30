import 'package:get/instance_manager.dart';
import 'package:movies/controllers/details_controller.dart';
import 'package:movies/controllers/home_controller.dart';
import 'package:movies/controllers/now_playing_controller.dart';
import 'package:movies/controllers/popular_controller.dart';
import 'package:movies/controllers/splash_controller.dart';
import 'package:movies/controllers/upcoming_controller.dart';
import 'package:movies/controllers/wish_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => DetailsController(), fenix: true);
    Get.lazyPut(() => NowPlayingController(), fenix: true);
    Get.lazyPut(() => PopularController(), fenix: true);
    Get.lazyPut(() => WishController(), fenix: true);
    Get.lazyPut(() => UpcomingController(), fenix: true);

  }
}
