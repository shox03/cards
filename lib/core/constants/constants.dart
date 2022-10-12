import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppConstants {
  // static const baseUrl = 'https://test.customer.api.delever.uz/v1/'; //test
  static const shipperId = !kDebugMode

      ? 'd4b1658f-3271-4973-8591-98a82939a664'
      : 'e2d30f35-3d1e-4363-8113-9c81fdb2a762';
  static const baseUrl = !kDebugMode
      ? 'https://test.customer.api.delever.uz/v1/'
      : 'https://customer.api.delever.uz/v1/';
  static const androidPlatformID = "6bd7c2e3-d35e-47df-93ce-ed54ed53f95f";
  static const iosPlatformID = "f6631db7-09d0-4cd9-a03a-b7a590abb8c1";

  static const apiKey = '1d47efd1-f633-41db-a353-234f595d9c1a';
  static const yandexKey = 'https://geocode-maps.yandex.ru/1.x/';

  static const FINISHED_ORDERS = 'e665273d-5415-4243-a329-aee410e39465';

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // static List<GradientClass> colors = [
  //   GradientClass(const Color(0xff182632), const Color(0xff445767)),
  //   // GradientClass(const Color(0xff937FF5), const Color(0xff735CE6)),
  //   GradientClass(const Color(0xff70B2FF), const Color(0xff5C9CE6)),
  //   GradientClass(const Color(0xff65C2C2), const Color(0xff86D1D1)),
  //   GradientClass(const Color(0xffFFB73D), const Color(0xffFFA000)),
  //   GradientClass(const Color(0xffFF5263), const Color(0xffFF3347)),
  // ];

  static List<String> backgroundList = [
    'assets/svg/ic_grey.svg',
    'assets/svg/ic_blue.svg',
    'assets/svg/ic_teal.svg',
    'assets/svg/ic_yellow.svg',
    'assets/svg/ic_red.svg',
  ];
  static List<GradientClass> colors = [
    GradientClass(const Color(0xff182632), const Color(0xff445767)),
    // GradientClass(const Color(0xff937FF5), const Color(0xff735CE6)),
    GradientClass(const Color(0xff70B2FF), const Color(0xff5C9CE6)),
    GradientClass(const Color(0xff65C2C2), const Color(0xff86D1D1)),
    GradientClass(const Color(0xffFFB73D), const Color(0xffFFA000)),
    GradientClass(const Color(0xffFF5263), const Color(0xffFF3347)),
  ];
}
class GradientClass {
  final Color color1;
  final Color color2;

  GradientClass(this.color1, this.color2);
}
