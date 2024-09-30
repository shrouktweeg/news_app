class ArticleModel{
final String status;
final List<Article> articles;
ArticleModel({
  required this.status,
  required this.articles
});
factory ArticleModel.fromJson(Map<String,dynamic>json){
  return ArticleModel(
      status: json['status'],
      articles: List.from(json['articles']).map((article)=>Article.fromJson(article)).toList()
  );
}
}
class Article{
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt
});
  factory Article.fromJson(Map<String,dynamic>json){
    return Article(author: json['source']['name']??"UnKnown",
        title: json['title']??"No Title",
        description: json['description']??"No description",
        url: json['url']??'',
        urlToImage: json['urlToImage']??"",
        publishedAt: json['publishedAt']??"",);
  }

}