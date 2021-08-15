import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-text.dart';
import 'package:said/components/said-title.dart';
import 'package:said/components/said-widget-card.dart';
import 'package:said/models/article.dart';
import 'package:intl/intl.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({ Key? key, required this.article }) : super(key: key);

  final Article article;

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SaidWidgetCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SaidTitle(text: widget.article.title),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    DateFormat('yyyy-MM-dd - kk:mm').format(widget.article.date.toLocal()),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                    ),
                  ),
                ),
                if (widget.article.mainImage != null)
                  Image.network(widget.article.mainImage!),
                SaidText(
                  text: widget.article.body, 
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                Divider(),
                SaidText(
                  text: widget.article.author, 
                  padding: EdgeInsets.only(bottom: 10),
                ),
                if (widget.article.authorPicture != null)
                  Image.network(
                    widget.article.authorPicture!,
                    height: 80,
                    alignment: (AppLocalizations.of(context)!.localeName == 'ar')? Alignment.centerRight : Alignment.centerLeft,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}