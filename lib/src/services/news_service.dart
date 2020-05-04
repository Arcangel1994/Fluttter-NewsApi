import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newproviders/src/models/category_model.dart';
import 'package:newproviders/src/models/news_models.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'fdf0e9eebb2e4bcf8f36e6bc4e1dad37';

class NewsService with ChangeNotifier{

  List<Article> headlines = [];

  String _selectedCategory = 'business';

  bool _isLoading = true;

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  //business entertainment general health science sports technology

  NewsService(){
    this.getTopHeadlines();
    categories.forEach((item){
      this.categoryArticles[item.name] = List();
    });
    this.getArticlesByCategory( this._selectedCategory );
  }

  bool get isLoading => this._isLoading;

  get selectedCategory => this._selectedCategory;
  set selectedCategory (String valor){
    this._selectedCategory = valor;
    this._isLoading = true;
    this.getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada => this.categoryArticles[this.selectedCategory];

  getTopHeadlines() async{

    final url = '$_URL_NEWS/top-headlines?country=mx&apiKey=$_APIKEY';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
    
  }

  getArticlesByCategory(String category) async{

    if(this.categoryArticles[category].length > 0){
      this._isLoading = false;
      notifyListeners();
      return this.categoryArticles[category];
    }

    final url = '$_URL_NEWS/top-headlines?country=mx&category=$category&apiKey=$_APIKEY';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.categoryArticles[category].addAll(newsResponse.articles);

    this._isLoading = false;
    notifyListeners();
  }

}