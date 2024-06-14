import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text( Environment.theMovieDbKey ), //usamos la VARIABLE DE ENTORNO de archiv .env
                                                //No continuar con video si no aparece la API KEY en la app
      )
    );
  }
}