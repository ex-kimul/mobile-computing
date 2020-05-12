import 'dart:convert';
import 'package:teropongduniaapp/model/artikel_model.dart';
import 'package:http/http.dart' as http;

class News {

  List<ArtikelModel> news = [];

  Future<void> getNews() async {

    String url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d22c8f0df9f74a88b94e4108b11a82bd";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArtikelModel artikelModel = ArtikelModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            url: element["url"],
          );
          news.add(artikelModel);
        }

      });
    }
  }

}
