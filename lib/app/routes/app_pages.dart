// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/foodhub_main/bindings/foodhub_main_binding.dart';
import '../modules/foodhub_main/views/foodhub_main_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FOODHUB_MAIN;

  static final routes = [
    GetPage(
      name: _Paths.FOODHUB_MAIN,
      page: () => const FoodhubMainView(),
      binding: FoodhubMainBinding(),
    ),
  ];
}
