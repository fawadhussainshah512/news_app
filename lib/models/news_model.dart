class NewsModel {
  final String newsHead;
  final String newsDes;
  final String newsImg;
  final String newsUrl;

  NewsModel({
    required this.newsHead,
    required this.newsDes,
    required this.newsImg,
    required this.newsUrl,
  });

  factory NewsModel.fromMap(Map<String, dynamic> news) {
    return NewsModel(
      newsHead: news["title"],
      newsDes: news["description"],
      newsImg: news["urlToImage"],
      newsUrl: news["url"],
    );
  }
}