import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/utils/constants.dart';

import '../utils/device_utils.dart';


class NewsCarousel extends StatelessWidget {
  final List<NewsModel> newsModelList;
  final Function(int) onTap;

  const NewsCarousel({super.key,
    required this.newsModelList,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kCarouselHeight,
      child: CarouselSlider(
        options: CarouselOptions(
          height: kCarouselHeight,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
        ),
        items: newsModelList.map((news) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => onTap(newsModelList.indexOf(news)),
                child: Container(
                  width: DeviceInfo.getScreenWidth(context),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Stack(
                      children: [
                        Image.network(
                          news.newsImg,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black12.withOpacity(0),
                                  Colors.black,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            padding: EdgeInsets.all(kDefaultPadding),
                            child: Text(
                              news.newsHead,
                              style: const TextStyle(
                                color: kSecondaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}