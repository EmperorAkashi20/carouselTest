import 'package:assign12/Utils/route_constants.dart';
import 'package:assign12/Views/home.dart';
import 'package:get/get.dart';

class NavRouter {
  static final generateRoute = [
    GetPage(
      name: home,
      page: () => Home(),
    ),
  ];
}
