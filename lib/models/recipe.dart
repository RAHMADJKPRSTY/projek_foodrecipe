class Recipe {
  final String name;
  final String images;
  final String rating;
  final String totalTime;
  final String description;
  final String videoUrl;

  Recipe(
      {this.name,
      this.images,
      this.rating,
      this.totalTime,
      this.description,
      this.videoUrl});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        images: json['thumbnail_url'] as String,
        rating: json['country'] as String,
        totalTime: json['total_time_minutes'] != null
            ? json['total_time_minutes'].toString() + " minutes"
            : "30 minutes",
        description: json['description'] != null ? json['description'] : " ",
        videoUrl: json['original_video_url'] != null
            ? json['original_video_url']
            : 'noVideo');
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
