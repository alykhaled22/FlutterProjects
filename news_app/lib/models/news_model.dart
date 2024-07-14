class NewsModel {
  final String? image;
  final String mainText;
  final String? secText;

  const NewsModel(
      {required this.image, required this.mainText, required this.secText});

  factory NewsModel.fromJson(json) {
    return NewsModel(
      image: json['urlToImage'],
      mainText: json['title'],
      secText: json['description'],
    );
  }
}
