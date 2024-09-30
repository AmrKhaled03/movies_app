class TrailerModel {
  final String id;
  final String key;
  final String name;
  final String site;
  final String type;

  TrailerModel({
    required this.id,
    required this.key,
    required this.name,
    required this.site,
    required this.type,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      id: json['id'] ?? '',
      key: json['key'] ?? '',
      name: json['name'] ?? '',
      site: json['site'] ?? '',
      type: json['type'] ?? '',
    );
  }
}
