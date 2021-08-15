class Article {
  int id;
  String title;
  String? description;
  String author;
  DateTime date;
  String body;
  String? authorPicture;
  String? mainImage;

  Article.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    title = json['title'] == null? "" : json['title'],
    author = json['authorName'] == null? "" : json['authorName'],
    date = DateTime.parse(json['published_at']),
    description = json['shortDescription'],
    body = json['body'] == null? "" : json['body'],
    authorPicture = json['authorPicture']?['formats']?['large']?['url'],
    mainImage = json['mainImage']?['formats']?['large']?['url'];
}