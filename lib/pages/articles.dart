import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-article-thumbnail.dart';
import 'package:said/models/article.dart';
import 'package:said/services/api.dart';

class Articles extends StatefulWidget {
  const Articles({ Key? key }) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {

  late List<Article> articles = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    fetchArticles().then((_articles) => setState(() {
      this.articles = _articles;
    }));
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          for (var article in articles)
            SaidArticleThumbnail(article: article)
        ],
      ),
    );
  }
}