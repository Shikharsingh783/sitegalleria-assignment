class ServiceType {
  final int price;
  final double rating;
  final String title;
  final String description;
  final Category type;

  ServiceType({
    required this.price,
    required this.rating,
    required this.title,
    required this.description,
    required this.type,
  });
}

enum Category {
  marriage,
  career,
  family,
  health,
}
