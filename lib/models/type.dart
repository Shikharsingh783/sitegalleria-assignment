class Type {
  final int price;
  final double rating;
  final String title;
  final String description;

  Type({
    required this.price,
    required this.rating,
    required this.title,
    required this.description,
  });
}

enum Category {
  marriage,
  career,
  family,
  health,
}
