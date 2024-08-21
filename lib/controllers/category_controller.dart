import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';
import 'package:news_app/utils/constants.dart';

class CategoryController extends GetxController {
  final String query;
  final newsModelList = <NewsModel>[].obs;
  final isLoading = true.obs;

  CategoryController({required this.query}) {
    getNewsByQuery(query);
  }

  void getNewsByQuery(String query) async {
    String url;
    if (query == "Top News") {
      url =topNewsUrl;
    } else {
      url =queryUrl;
    }

    http.Response response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);

    for (var element in data["articles"]) {
      try {
        newsModelList.add(NewsModel.fromMap(element));
      } catch (e) {
        print(e);
      }
    }
    isLoading.value = false;
  }
}