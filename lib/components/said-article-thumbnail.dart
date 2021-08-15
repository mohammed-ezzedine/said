import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-scaffold.dart';
import 'package:said/components/said-text.dart';
import 'package:said/components/said-widget-card.dart';
import 'package:said/models/article.dart';
import 'package:intl/intl.dart';
import 'package:said/pages/articlePage.dart';

class SaidArticleThumbnail extends StatefulWidget {
  const SaidArticleThumbnail({ Key? key, required this.article }) : super(key: key);

  final Article article;

  @override
  _SaidArticleThumbnailState createState() => _SaidArticleThumbnailState();
}

class _SaidArticleThumbnailState extends State<SaidArticleThumbnail> {
  @override
  Widget build(BuildContext context) {
    return SaidWidgetCard(
      child: TextButton(
        onPressed: () { 
          Navigator.push(context, MaterialPageRoute(builder: (context) => SaidScaffold(
            body: ArticlePage(article: widget.article),
            hasParent: true,  
          )));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.article.title,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              widget.article.author,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                DateFormat('yyyy-MM-dd - kk:mm').format(widget.article.date.toLocal()),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}