import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  RxInt currentPage = 0.obs;
  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;
  RxDouble value = 0.0.obs;
  late CarouselController carouselController;

  @override
  void onInit() {
    videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0);
    initializeVideoPlayerFuture = videoPlayerController.initialize();

    carouselController = CarouselController();

    super.onInit();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
