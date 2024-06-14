

//Los REPOSITORIOS son lo que llamarán a los DATASOURCES
//Definimos como lucen los origines de datos que pueden traer películas
//Definimos métodos|clases para traer la data

import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieDatasource {

  Future<List<Movie>> getNowPLaying({ int page = 1 });

}