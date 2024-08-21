import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/views/news_view.dart';
import '../widgets/news_carousel.dart';
import '../widgets/news_list.dart';
import '../widgets/search_bar.dart';
import 'category_wise_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("NEWSIFY"),
            centerTitle: true,
            backgroundColor: kPrimaryColor,
            elevation: 0,
          ),
          body: Obx(
                () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: kDefaultPadding * 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: SearchBarWidget(
                      controller: controller.searchController,
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          Get.to(() => CategoryScreen(query: value));
                        }
                      },
                    ),
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: NewsCarousel(
                      newsModelList: controller.newsModelListCarousel,
                      onTap: (index) {
                        Get.to(() => NewsView(
                          url: controller.newsModelListCarousel[index].newsUrl,
                        ));
                      },
                    ),
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: NewsList(
                      newsModelList: controller.newsModelList,
                      onTap: (index) {
                        Get.to(() => NewsView(
                          url: controller.newsModelList[index].newsUrl,
                        ));
                      },
                    ),
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => CategoryScreen(query: "Top News"));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 2,
                          vertical: kDefaultPadding / 2,
                        ),
                        child: const Text("Show More News",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}