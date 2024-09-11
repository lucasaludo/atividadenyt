
import 'package:dio/dio.dart';
import '../models/livros_models.dart';

class BookController {
  final String apiKey = '0MOfjBH7KDDi122S8p5FoTAzpbAhrfyN';
  final Dio _dio = Dio();

  Future<List<Book>> fetchBooks() async {
    try {
      final response = await _dio.get(
        'https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json',
        queryParameters: {
          'api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data['results'] != null && data['results']['books'] != null) {
          final books = data['results']['books'] as List;
          return books.map((book) => Book.fromJson(book)).toList();
        } else {
          throw Exception('Estrutura inesperada da resposta da API.');
        }
      } else {
        throw Exception('Erro ao carregar livros. Status: ${response.statusCode}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception('Erro: ${e.response?.statusCode}, ${e.response?.statusMessage}');
      } else {
        throw Exception('Erro de rede: ${e.message}');
      }
    }
  }
}
