import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/utils/constants.dart';


class NewsList extends StatelessWidget {
  final List<NewsModel> newsModelList;
  final Function(int) onTap;

  NewsList({
    required this.newsModelList,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: newsModelList.length,
      itemBuilder: (context, index) {
        final news = newsModelList[index];
        return InkWell(
          onTap: () => onTap(index),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 1.0,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      news.newsImg,
                      fit: BoxFit.fitHeight,
                      height: kNewsCardHeight,
                      width: double.infinity,
                    ),
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
                      padding: EdgeInsets.fromLTRB(
                        kDefaultPadding,
                        kDefaultPadding,
                        kDefaultPadding / 2,
                        kDefaultPadding / 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news.newsHead,
                            style: const TextStyle(
                              color: kSecondaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: kDefaultPadding / 4),
                          Text(
                            news.newsDes.length > 50
                                ? "${news.newsDes.substring(0, 55)}..."
                                : news.newsDes,
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
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
  }
}