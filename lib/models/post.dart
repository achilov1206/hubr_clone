class Post{
  
  Post({this.title, this.seen, this.rating, this.content, this.comments, this.categories, this.author});

  final String title;
  final int seen;
  final int rating;
  final DateTime created = DateTime.now();
  final String content;
  final String comments;
  final String categories;
  final String author;

}