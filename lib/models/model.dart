class PostModel {
  String postId;
  String authorName;
  int width;
  int height;
  String imageUrl;
  String downloadUrl;

  PostModel(
      {required this.postId,
      required this.authorName,
      required this.width,
      required this.height,
      required this.imageUrl,
      required this.downloadUrl});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        postId: json["id"],
        authorName: json["author"],
        width: json["width"],
        height: json["height"],
        imageUrl: json['url'],
        downloadUrl: json['download_url']);
  }
}
