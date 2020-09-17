import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/controllers/search_movies_controller.dart';
import 'package:kobe_code_challenge/views/widgets/movie_cards_list_view.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchMoviesController = Get.find<SearchMoviesController>();
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textEditingController,
          onChanged: searchMoviesController.search,
          autofocus: true,
        ),
      ),
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: MovieCardsListView(
          moviesController: searchMoviesController,
        ),
      ),
    );
  }

  void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
