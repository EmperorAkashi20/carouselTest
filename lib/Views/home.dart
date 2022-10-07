import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:assign12/Controller/home_controller.dart';
import 'package:assign12/Utils/text_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../Models/data_model.dart';
import 'details_screen.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: ListView(
            children: [
              const Center(
                child: Text("Gotta Catch'em All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 30)),
              ),
              CarouselSlider.builder(
                itemCount: dataList.length,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: false,
                  pageSnapping: false,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.9,
                  aspectRatio: 0.75,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      homeController.currentPage.value = index;
                      debugPrint(homeController.currentPage.value.toString());
                    });
                  },
                ),
                carouselController: homeController.carouselController,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  if (itemIndex == 0) {
                    return SizedBox(
                      width: windowWidth * 0.8,
                      height: windowHeight * 0.5,
                      child: FutureBuilder(
                        future: homeController.initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            homeController.currentPage.value == 0
                                ? homeController.videoPlayerController.play()
                                : homeController.videoPlayerController.pause();
                            return VideoPlayer(
                                homeController.videoPlayerController);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    );
                  } else {
                    return Container(
                      width: windowWidth * 0.7,
                      height: windowHeight * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            dataList[itemIndex].imageName,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                child: Obx(
                  (() => homeController.currentPage.value == 0
                      ? FadeInLeft(
                          duration: const Duration(seconds: 1),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Text(
                                  dataList[homeController.currentPage.value]
                                      .title,
                                  style: TextStyles.headingTextStyle,
                                ),
                                Text(
                                  "ATK: ${dataList[homeController.currentPage.value].attack}",
                                  style: TextStyles.detailsTextStyle,
                                ),
                              ],
                            ),
                          ),
                        )
                      : homeController.currentPage.value == 1
                          ? FadeInRight(
                              duration: const Duration(seconds: 1),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      dataList[homeController.currentPage.value]
                                          .title,
                                      style: TextStyles.headingTextStyle,
                                    ),
                                    Text(
                                      "ATK: ${dataList[homeController.currentPage.value].attack}",
                                      style: TextStyles.detailsTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : homeController.currentPage.value == 2
                              ? FadeInLeft(
                                  duration: const Duration(seconds: 1),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          dataList[homeController
                                                  .currentPage.value]
                                              .title,
                                          style: TextStyles.headingTextStyle,
                                        ),
                                        Text(
                                          "ATK: ${dataList[homeController.currentPage.value].attack}",
                                          style: TextStyles.detailsTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : FadeInRight(
                                  duration: const Duration(seconds: 1),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          dataList[homeController
                                                  .currentPage.value]
                                              .title,
                                          style: TextStyles.headingTextStyle,
                                        ),
                                        Text(
                                          "ATK: ${dataList[homeController.currentPage.value].attack}",
                                          style: TextStyles.detailsTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
