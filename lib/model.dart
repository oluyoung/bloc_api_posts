class PostModel {
  final Map<String, dynamic> post = {};

  PostModel(Map<String, dynamic> post) {
    this.post.addAll(post);
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(json);
  }
}
