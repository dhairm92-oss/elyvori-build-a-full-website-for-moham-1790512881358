class Project {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String githubUrl;
  final String liveUrl;
  final List<String> technologies;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.githubUrl,
    required this.liveUrl,
    required this.technologies,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      githubUrl: json['githubUrl'] ?? '',
      liveUrl: json['liveUrl'] ?? '',
      technologies: List<String>.from(json['technologies'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'githubUrl': githubUrl,
        'liveUrl': liveUrl,
        'technologies': technologies,
      };
}
