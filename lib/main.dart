import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/views/home/home_page.dart';
import 'package:kobe_code_challenge/views/movie_details/movie_details_page.dart';
import 'package:kobe_code_challenge/views/search/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/details", page: () => MovieDetailsPage()),
        GetPage(name: "/search", page: () => SearchPage()),
      ],
    );
  }
}
