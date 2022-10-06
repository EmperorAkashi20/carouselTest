import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  late PageController pageController;
  int currentPage = 0;
  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;
  late RxDouble value;

  @override
  void onInit() {
    pageController =
        PageController(initialPage: currentPage, viewportFraction: 0.8);
    videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    videoPlayerController.setLooping(true);
    initializeVideoPlayerFuture = videoPlayerController.initialize();

    value = 0.0.obs;

    super.onInit();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    pageController.dispose();
    super.dispose();
  }
}
