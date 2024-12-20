// import 'package:app_moviefinal/Screens/loginScreen.dart';
import 'package:app_moviefinal/Screens/loginScreen.dart';
import 'package:app_moviefinal/Screens/movieScreen.dart';
import 'package:app_moviefinal/Screens/multimedia.dart';
import 'package:app_moviefinal/Screens/registerScreen.dart';
import 'package:app_moviefinal/Screens/screenApiAntiguo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      //Modo oscuro o claro aqui

       
     debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loginscreen(), // Pantalla inicial
        '/registro': (context) => const Registerscreen(),
        '/movieApp': (context) => const ApiMovie(),
        '/multimedia': (context) => const Multimedia(), 
      // '/multimedia': (context) {
      //   final args = ModalRoute.of(context)!.settings.arguments as String;
      //   return Multimedia(videoUrl: args);
      //   },
      },
     
    );
  }
}
