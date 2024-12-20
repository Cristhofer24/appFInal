import 'package:app_moviefinal/Api/constants.dart';
import 'package:app_moviefinal/model/model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Api{

  static const _trendingUrl='https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apikey}';
  static const _topRateUrl='https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apikey}';
  static const _upcomingUrl='https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apikey}';

  Future<List<Movie>> getTrendingMovie() async{

    final response = await http.get(Uri.parse(_trendingUrl));

    if(response.statusCode == 200){

      final decodedData = json.decode(response.body)['results'] as List;

      return decodedData.map((movie) => Movie.fromJson(movie)).toList();

    }else{
      throw Exception('Somethings Happened');
    }
  }
  Future<List<Movie>> getTopRategMovie() async{

    final response = await http.get(Uri.parse(_topRateUrl));

    if(response.statusCode == 200){

      final decodedData = json.decode(response.body)['results'] as List;

      return decodedData.map((movie) => Movie.fromJson(movie)).toList();

    }else{
      throw Exception('Somethings Happened');
    }
  }
  Future<List<Movie>> getUpcominMovie() async{

    final response = await http.get(Uri.parse(_upcomingUrl));

    if(response.statusCode == 200){

      final decodedData = json.decode(response.body)['results'] as List;

      return decodedData.map((movie) => Movie.fromJson(movie)).toList();

    }else{
      throw Exception('Somethings Happened');
    }
  }



}