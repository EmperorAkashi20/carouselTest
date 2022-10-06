import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:assign12/Controller/home_controller.dart';
import 'package:assign12/Utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../Models/data_model.dart';
import 'details_screen.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              const Center(
                child: Text("Gotta Catch'em All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 30)),
              ),
              SizedBox(
                height: windowHeight * 0.8,
                child: PageView.builder(
                    itemCount: dataList.length,
                    physics: const BouncingScrollPhysics(),
                    controller: homeController.pageController,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: windowHeight * 0.026,
                              ),
                              Expanded(
                                flex: 7,
                                child: FutureBuilder(
                                  future: homeController
                                      .initializeVideoPlayerFuture,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      homeController.pageController.offset <=
                                              0.0
                                          ? homeController.videoPlayerController
                                              .play()
                                          : homeController.videoPlayerController
                                              .pause();
                                      return VideoPlayer(
                                          homeController.videoPlayerController);
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: FadeInLeft(
                                  duration: const Duration(seconds: 2),
                                  delay: const Duration(seconds: 1),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: windowHeight * 0.03,
                                      ),
                                      Text(
                                        dataList[index].title.toString(),
                                        style: TextStyles.headingTextStyle,
                                      ),
                                      Text(
                                        "ATK: ${dataList[index].attack.toString()}",
                                        style: TextStyles.detailsTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      } else {
                        return carouselView(index);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget carouselView(int index) {
    debugPrint("kk");
    debugPrint(homeController.pageController.position.toString());
    debugPrint("kk");

    return AnimatedBuilder(
      animation: homeController.pageController,
      builder: (context, child) {
        homeController.value.value = 0.0;
        if (homeController.pageController.position.haveDimensions) {
          homeController.value.value =
              index.toDouble() - (homeController.pageController.page ?? 0);
          homeController.value.value =
              (homeController.value * 0.038).clamp(-1, 1);
        }
        // debugPrint(homeController.value.toString());
        return Transform.rotate(
          angle: pi * homeController.value.value,
          child: carouselCard(dataList[index]),
        );
      },
    );
  }

  Widget carouselCard(DataModel data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: data.imageName,
              child: GestureDetector(
                onTap: () {
                  Get.to(DetailsScreen(
                    data: data,
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(
                            data.imageName,
                          ),
                          fit: BoxFit.fill),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Colors.black26)
                      ]),
                ),
              ),
            ),
          ),
        ),
        FadeInLeft(
          duration: const Duration(seconds: 2),
          delay: const Duration(seconds: 1),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Text(
                  data.title,
                  style: TextStyles.headingTextStyle,
                ),
                Text(
                  "ATK: ${data.attack}",
                  style: TextStyles.detailsTextStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
