import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/category_controller.dart';
import 'package:news_app/utils/constants.dart';
import '../widgets/news_list.dart';
import 'news_view.dart';

class CategoryScreen extends GetView<CategoryController> {
  CategoryScreen({super.key, required this.query})
      : controller = Get.put(CategoryController(query: query));

  final String query;
  final CategoryController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NEWSIFY"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Obx(
            () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kDefaultPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Text(
                  query,
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              NewsList(
                newsModelList: controller.newsModelList,
                onTap: (index) {
                  Get.to(() => NewsView(
                    url: controller.newsModelList[index].newsUrl,
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}