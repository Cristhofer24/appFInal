import 'package:app_moviefinal/Api/apikey.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Apiservice {
  final String apiKey = apikey;
  final String baseUrl = 'https://api.themoviedb.org/3';

  // Función para obtener las películas en tendencia
  Future<List<Map<String, dynamic>>> obtenerPeliculasTrending() async {
    final url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey&language=es-ES');
    
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;
      return results.map((movie) => movie as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  // Función para obtener el trailer de una película
  Future<String?> obtenerTrailerPelicula(int movieId) async {
    final url = Uri.parse('$baseUrl/movie/$movieId/videos?api_key=$apiKey&language=es-ES');
    
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'];
      
      if (results.isNotEmpty) {
        // El primer trailer encontrado (si existe)
        return 'https://www.youtube.com/watch?v=${results[0]['key']}';
      }
    }
    
    return null;  // Si no se encuentra trailer
  }
}