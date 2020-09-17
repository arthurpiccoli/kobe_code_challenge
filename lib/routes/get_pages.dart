import 'package:get/get.dart';
import 'package:kobe_code_challenge/routes/bindings/global_bindings.dart';
import 'package:kobe_code_challenge/routes/bindings/home_bindings.dart';
import 'package:kobe_code_challenge/routes/bindings/search_bindings.dart';
import 'package:kobe_code_challenge/routes/route_names.dart';
import 'package:kobe_code_challenge/views/home/home_page.dart';
import 'package:kobe_code_challenge/views/movie_details/movie_details_page.dart';
import 'package:kobe_code_challenge/views/search/search_page.dart';
import 'package:kobe_code_challenge/views/splash/splash_page.dart';

final List<GetPage> getPages = [
  GetPage(
    name: RouteNames.splash,
    page: () => SplashPage(),
    binding: GlobalBindings(),
  ),
  GetPage(
    name: RouteNames.home,
    page: () => HomePage(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: RouteNames.search,
    page: () => SearchPage(),
    binding: SearchBindings(),
  ),
  GetPage(
    name: RouteNames.details,
    page: () => MovieDetailsPage(),
  ),
];
