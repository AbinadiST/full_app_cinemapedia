import 'package:flutter_dotenv/flutter_dotenv.dart';



// se realiza de esta manera las variables de entorno porque por algún espacio agregado
// puede marcar error

class Environment {

  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';
  //importamos el paquete de DOTENV

}