// models/book_model.dart
class Book {
  final String title;
  final String author;
  final String description;
  final String bookImage;

  Book({
    required this.title,
    required this.author,
    required this.description,
    required this.bookImage,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] ?? 'Título não disponível',
      author: json['author'] ?? 'Autor desconhecido',
      description: json['description'] ?? 'Descrição não disponivel',
      bookImage: json['book_image'] ?? '',
    );
  }
}
