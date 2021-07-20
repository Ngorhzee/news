// class NewsModel {


//   List<Articles> articles;
//   NewsModel.fromjson(Map<String,dynamic>jsondata){
//    this.articles=articles.map((e) => Articles.fromJson(jsondata)).toList();
//   }
// }


class Article{
  String image,title,author,content;
  DateTime date;
  Article.fromJson(Map<String,dynamic> jsondata){
    this.image=jsondata['urlToImage'];
    this.content=jsondata['content'];
    this.author=jsondata['author'];
    this.title=jsondata['title'];
    this.date= DateTime.parse(jsondata['publishedAt']);
  }
}

