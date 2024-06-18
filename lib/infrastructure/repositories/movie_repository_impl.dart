

//Esta clase llamará al DATASOURCE y del DATASOURCE llamará esos métodos 

import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repositories.dart';

class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDatasource datasource;

  MovieRepositoryImpl( this.datasource );

  @override
  Future<List<Movie>> getNowPLaying({int page = 1}) {
  
   return datasource.getNowPLaying(page: page);
  }


}