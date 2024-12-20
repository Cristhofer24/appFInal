import 'package:app_moviefinal/Api/api.dart';
import 'package:app_moviefinal/Screens/screenApiAntiguo.dart';
import 'package:app_moviefinal/Screens/widgets/HeaderWidget.dart';
import 'package:app_moviefinal/Screens/widgets/SecondWidget.dart';
import 'package:app_moviefinal/Screens/widgets/TopWidget.dart';
import 'package:app_moviefinal/model/model.dart';
import 'package:flutter/material.dart';

class Moviescreen extends StatefulWidget {
  const Moviescreen({super.key});

  @override
  State<Moviescreen> createState() => _MoviescreenState();
}

class _MoviescreenState extends State<Moviescreen> {
  late Future<List<Movie>> trendingMovie;
  late Future<List<Movie>> topRelatesMovie;
  late Future<List<Movie>> upcomingMovie;

  @override
  void initState() {
    super.initState();
    trendingMovie = Api().getTrendingMovie();
    topRelatesMovie = Api().getTopRategMovie();
    upcomingMovie = Api().getUpcominMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("APP-MOVIE 2"),
        centerTitle: true,
        actions: [
          // Agregamos el botón de navegación al ApiMovie
          IconButton(
            icon: Icon(Icons.movie_creation),  // Icono para el botón
            onPressed: () {
              // Navegar a ApiMovie cuando el botón sea presionado
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ApiMovie()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PELICULAS DE ESTRENO",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 16),
              
              //HeaderSlider
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      if (snapshot.hasData) {
                        return HeaderSlide(snapshot: snapshot);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "RELATO DE PELICULAS",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 32),
              //TopRelates
              SizedBox(
                child: FutureBuilder(
                  future: topRelatesMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      if (snapshot.hasData) {
                        return TopWidget(snapshot: snapshot);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "PROXIMAS PELICULAS",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 32),
              //Secondary Widget
              SizedBox(
                child: FutureBuilder(
                  future: upcomingMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      if (snapshot.hasData) {
                        return SecondFileWidget(snapshot: snapshot);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
