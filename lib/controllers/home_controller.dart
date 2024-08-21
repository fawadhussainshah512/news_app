import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';
import 'package:news_app/utils/constants.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController();
  final List<NewsModel> newsModelList = <NewsModel>[].obs;
  final List<NewsModel> newsModelListCarousel = <NewsModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getNewsByQuery("corona");
    getNewsOfSource();
  }

  void getNewsByQuery(String query) async {
    String url =queryUrl;
    http.Response response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);

    for (var element in data["articles"]) {
      try {
        newsModelList.add(NewsModel.fromMap(element));
      } catch (e) {
        print(e);
      }
      if (newsModelList.length == 5) {
        break;
      }
    }
    isLoading.value = false;
  }

  void getNewsOfSource() async {
    String url =topNewsUrl;
    http.Response response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);

    for (var element in data["articles"]) {
      try {
        newsModelListCarousel.add(NewsModel.fromMap(element));
      } catch (e) {
        print(e);
      }
    }
    isLoading.value = false;
  }
}