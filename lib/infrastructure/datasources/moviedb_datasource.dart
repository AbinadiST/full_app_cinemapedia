import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
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
            'api_key': Environment.theMovieDbKey, //son configuraciones que están en POSTMAN
            'language': 'es-MX'
          }   
        )
    ); 


    //* Listado global para los ENDPOINTS ------------------------------------------


    List<Movie> _jsonToMovies( Map<String,dynamic> json ) { //? video OBTENER PELÍCULAS POPULARES minuto 3:00

    final movieDBResponse = MovieDbResponse.fromJson(json);
    
    final List<Movie> movies = movieDBResponse.results // RESULTS es un tipo de dato LIST de tipo MOVIES
    .where((moviedb) => moviedb.posterPath != 'no-poster' ) //WHERE = si POSTERPATH es != a NO-POSTER continúa con el código, no mostrar sin POSTER de película
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
      ).toList();
    
    return movies;

    }
  

  //! Se realizan las implementaciones ------------------------------------------
  

  //* PLAYING --------------------------------------------------------


  @override
  Future<List<Movie>> getNowPLaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing', // empezamos con slash '/' porque arriba en BASEURL no terminamos con slash
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data); 

  }

  
  //* POPULAR ----------------------------------------------------------


  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    
    final response = await dio.get('/movie/popular', // empezamos con slash '/' porque arriba en BASEURL no terminamos con slash
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
    
  }


  //* GET_TOP_RATED ----------------------------------------


  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    
    final response = await dio.get('/movie/top_rated', // empezamos con slash '/' porque arriba en BASEURL no terminamos con slash
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
    
  }

  //* GET UP COMING ----------------------------------------------

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    
    final response = await dio.get('/movie/upcoming', // empezamos con slash '/' porque arriba en BASEURL no terminamos con slash
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
    
  }
  
  //* GET MOVIE BY ID ------------------------------------------------------------------

  @override
  Future<Movie> getMovieById( String id ) async{

    final response = await dio.get('/movie/$id'); // empezamos con slash '/' porque arriba en BASEURL no terminamos con slash
    if ( response.statusCode != 200 ) throw Exception( 'Movie with id: $id not found');

    //* Realizamos el mapeo 

    final movieDetails = MovieDetails.fromJson( response.data );

    //* Realizamos un MAPPER

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;

  }


  

}