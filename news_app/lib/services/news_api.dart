import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

class NewsApi {
  final Dio dio;

  NewsApi({required this.dio});

  Future<List<NewsModel>> getNews({required String category}) async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=69a53e4a16b04a2daa3569d57a5ecef0&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];

      List<NewsModel> newsList = [];

      for (var article in articles) {
        NewsModel newsModel = NewsModel.fromJson(article);
        newsList.add(newsModel);
      }

      return newsList;
    } catch (e) {
      return [];
    }
  }
}
