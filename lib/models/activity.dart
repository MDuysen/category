class ActivityModel {
  String? activity;
  String? type;
  int? participants;
  double? price;
  String? link;
  String? key;
  double? accessibility;

  ActivityModel({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      activity: json['activity'],
      type: json['type'],
      participants: json['participants'],
      price: json['price'] is int ? 0.0 : json['price'],
      link: json['link'],
      key: json['key'],
      accessibility: json['accessibility'] is int ? 0.0 : json['price'],
    );
  }
}
