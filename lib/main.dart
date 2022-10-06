import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'Utils/nav_router.dart';
import 'Utils/route_constants.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // This helps in using of widgets before the app has been initialized

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const TestApp());
  });
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        //This is used to make the app responsive. The breakpoints are what define when the app is supposed to change its state. This is particularly useful if the same app is being used for tabs, different sizes of mobile phones as well as the web.
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 2460,
        minWidth: 450,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: home,
      getPages: NavRouter
          .generateRoute, //For navigating to different pages and generating the routes.
      title: 'Test App',
    );
  }
}
