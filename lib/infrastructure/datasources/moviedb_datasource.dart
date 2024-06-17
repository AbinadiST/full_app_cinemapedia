import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

// Se instala el paquete: dio (también esta http esos dos son los más populares) para hacer peticiones http, 
// CTRL + SHIFT + P => PUBSPEC ASISST => dio | para instalar paquete DIO
// DIO: Gestro de peticiones HTTP


class MoviedbDatasource extends MoviesDatasource { //se extiende de MOVIESDATASOURCE por ende A FUERZA debe estar sú método
  
  //* Esto es nuestro cliente de HTTP para THE MOVIE DB

    final dio = Dio( // creamos la instancia del paquete DIO
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3', // Cuando usemos DIO, Indicamos que todas las peticiones tendrán el BASEURL preconfigurada
        queryParameters: {
            'api_key': Environment.theMovieDbKey,
            'language': 'es-MX'
          }   
        )
    ); 
  
  @override
  Future<List<Movie>> getNowPLaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing'); // empezamos con slash '/' porque arriba en BASEURL no terminamos con slash
    final List<Movie> movies = [];
    
    return movies;

  }


}