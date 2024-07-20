

//Esta clase llamará al DATASOURCE y del DATASOURCE llamará esos métodos 

import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repositories.dart';

class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDatasource datasource;

  MovieRepositoryImpl( this.datasource );

  //* PLAYING ------------------------------------------------


  @override
  Future<List<Movie>> getNowPLaying({int page = 1}) {
  
   return datasource.getNowPLaying(page: page);
  }
  
  //* POPULAR -------------------------------------------------

  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    
    return datasource.getPopular(page: page);
  }


  //* GET_TOP_RATED ----------------------------------------------
  

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {

    return datasource.getTopRated(page: page);
  }
  

  //* GET_UP_COMING -----------------------------------------------


  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {

    return datasource.getUpcoming(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {

    return datasource.getMovieById(id);
    
  }


}